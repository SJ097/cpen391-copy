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
		check_extract("email", "email");
		check_extract("phone_number", "phone_number");
		check_extract("passport_id", "passport_id");
		check_extract("first_name", "first_name");
		check_extract("last_name", "last_name");
		check_extract("street_number", "street_number");
		check_extract("street_address", "street_address");
		check_extract("city", "city");
		check_extract("postal_code", "postal_code");
		check_extract("gender", "gender");
		check_extract("dob", "dob");
	}
	
	//check that there is only one user account given user_id
	function checkAccountUniqueness($user_id, $database_connection) {
		$sql = "SELECT email FROM users WHERE user_id='$user_id'";
		
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
		elseif($stmt->rowCount() > 1) {
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "Fatal error: multiple accounts with the same accounts have been updated.
					This should be impossible. Please report this behaviour to the staff");
			echo json_encode($return_arr);
			die();
		}
		
		//at this point of execution, rowCount must be 1
	}

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$user_id;
	$email;
	$phone_number;
	$passport_id;
	$first_name;
	$last_name;
	$street_number;
	$street_address;
	$city;
	$postal_code;
	$gender;
	$dob;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//empty field checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			checkAccountUniqueness($user_id, $conn);
			
			//update the database
			$sql = "UPDATE users
					SET email='$email',
						phone_number='$phone_number',
						passport_id='$passport_id',
						first_name='$first_name',
						last_name='$last_name',
						street_number='$street_number',
						street_address='$street_address',
						city='$city',
						postal_code='$postal_code',
						gender='$gender',
						dob='$dob'
					WHERE user_id='$user_id'";;
			
			// Prepare statement
			$stmt = $conn->prepare($sql);
				
			// execute the query
			$stmt->execute();
			
			$return_arr = array(
				'success' => '1',
				'fail_reason' => "None");
			echo json_encode($return_arr);
			die();
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