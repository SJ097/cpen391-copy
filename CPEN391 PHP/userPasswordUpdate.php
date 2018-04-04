<?php
	//this function is from w3schools.com
	function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
	
	//Functionality: checks a single POST parameter to see if it's empty and extracts the data
	//Inputs: 
	//		1) parameter name is the name of the POST request parameter to check its emptiness
	//		2) success variable name is the variable name of the variable you want to extract the POST param value into
	function check_extract($POST_param_name, $success_variable_name, $function_name) {
		if (empty($_POST["$POST_param_name"])) {
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "'$POST_param_name' field is required");
			echo json_encode($return_arr);
			die();		
		} else {
			$GLOBALS["$success_variable_name"] = test_input($_POST["$POST_param_name"]);
		}
	}
	
	function check_all_inputs() {
		check_extract("user_id", "user_id");
		check_extract("old_password", "old_password");
		check_extract("new_password", "new_password");
	}
	
	//verify that the old password matches what's in the database
	//void function
	function verifyOldPassword($old_password, $database_connection) {
		$sql = "SELECT encrypted_password FROM users WHERE user_id='$GLOBALS[user_id]'";
		// Prepare statement
		$stmt = $database_connection->prepare($sql);
			
		// execute the query
		$stmt->execute();
		
		//user doesn't exist
		if($stmt->rowCount() == 0) {
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "Error: no account with such user_id was found");
					
			echo json_encode($return_arr);
			die();
		}
		
		//more than 1 accounts associated with user_id which is impossible
		elseif($stmt->rowCount() > 1) {
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "Fatal Error: More than 1 rows were updated. Exactly $numRowsUpdated rows.
					Please report this behaviour to the staff");
					
			echo json_encode($return_arr);
			die();
		}
		
		//1 row must have been returned then
		
		//fetch the row
		$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
		$password_from_database = $result[0]["encrypted_password"];
		
		//in case if passwords do not match
		if($password_from_database != $old_password) {
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "Entered old password and password on the database does not match");
					
			echo json_encode($return_arr);
			die();
		}
		
		//passwords must match now
	}
	
	//used after verification
	function updatePassword($new_password, $user_id, $database_connection) {
		$sql = "UPDATE users SET encrypted_password='$new_password' WHERE user_id='$user_id'";
		
		// Prepare statement
		$stmt = $database_connection->prepare($sql);
		
		// execute the query
		$stmt->execute();
		
		//We don't need to check if more than 1 accounts with the same user_id exists.
		//It has already been checked in the verifyOldPassword function
		
		$return_arr = array(
			'success' => '1',
			'fail_reason' => 'None');
		
		//return data
		echo json_encode($return_arr);
	}

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$user_id;
	$new_password;
	$old_password;
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//empty field checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			verifyOldPassword($old_password, $conn);
			
			updatePassword($new_password, $user_id, $conn);
		}
		catch(PDOException $e)
		{
			$return_arr = array(
				'success' => '0',
				'fail_reason' => $e->getMessage());
			echo json_encode($return_arr);
		}
	}

?>