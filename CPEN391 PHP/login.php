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
		check_extract("email", "email");
		check_extract("encrypted_password", "encrypted_password");
	}
		

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$email;
	$encrypted_password;
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//error checking of input fields
		check_all_inputs();
		
		//print_r("POST request successful! email: $email password: $encrypted_password \n");
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			//print_r("Connected to database successfully\n"); 
			
			$sql = "SELECT * FROM users WHERE email='$email'";
			
			// Prepare statement
			$stmt = $conn->prepare($sql);
			
			// execute the query
			$stmt->execute();
			
			//no such email
			if($stmt->rowCount() == 0) {
				
				//passwords match
				$return_arr = array(
					'success' => '0',
					'fail_reason' => 'No such email');
					
				//return data
				echo json_encode($return_arr);
				die();
			}
			else if($stmt->rowCount() > 1) {
				//passwords match
				$return_arr = array(
					'success' => '0',
					'fail_reason' => 'Multiple rows were returned although email is a unique key');
				
				//return data
				echo json_encode($return_arr);
				die();
			}
			
			//fetch password from database
			$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
			$password_from_database = $result[0]["encrypted_password"];
			
			//if passwords do not match
			if($password_from_database != $encrypted_password) {
				//passwords do not match
				$return_arr = array(
					'success' => '0',
					'fail_reason' => 'email and passwords do not match');
				
				//return data
				echo json_encode($return_arr);
				die();
			}
			
			//passwords match: Now give the client all info about the user EXCEPT password
			
			$user_info = array(
				'user_id' => $result[0]['user_id'],
				'email' => $result[0]['email'],
				'phone_number' => $result[0]['phone_number'],
				'first_name' => $result[0]['first_name'],
				'last_name' => $result[0]['last_name'],
				'encrypted_password' => $result[0]['encrypted_password'],
				'street_number' => $result[0]['street_number'],
				'street_address' => $result[0]['street_address'],
				'city' => $result[0]['city'],
				'postal_code' => $result[0]['postal_code'],
				'gender' => $result[0]['gender'],
				'dob' => $result[0]['dob']);
			
			$return_arr = array(
				'success' => '1',
				'fail_reason' => 'None',
				'user_info' => $user_info);
			
			//return data
			echo json_encode($return_arr);
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