<?php
	//IMPORTANT NOTE: This script assumes the front end checks the valid fields before HTTP Post request is sent

	//this function is from w3schools.com
	//removes special characters in the input and whitespace
	function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
	
	//parameter name is the name of the POST request parameter to check its emptiness
	//success variable name is the variable name of the variable you want to extract the POST param value into
	function check_each_input($param_name, $success_variable_name) {
		if (empty($_POST["$param_name"])) {
			//if the input is empty, send error message to the client
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "'$param_name' field is required");
			echo json_encode($return_arr);
			die();		
		} else {
			//if successful, extract and store it in a global variable
			$GLOBALS["$success_variable_name"] = test_input($_POST["$param_name"]);
		}
	}
	
	//checks the inputs
	//POST: if correct inputs, it stores the correct inputs in the global variables
	//		if not correct, script ends
	function check_all_inputs() {
		check_each_input("email", "input_email");
		check_each_input("phone_number", "input_phone_number");
		check_each_input("first_name", "input_first_name");
		check_each_input("last_name", "input_last_name");
		check_each_input("encrypted_password", "input_encrypted_password");
		check_each_input("street_number", "input_street_number");
		check_each_input("street_address", "input_street_address");
		check_each_input("city", "input_city");
		check_each_input("postal_code", "input_postal_code");
		check_each_input("gender", "input_gender");
		check_each_input("dob", "input_dob");
		check_each_input("passport_id", "input_passport_id");
	}

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$input_email;
	$input_phone_number;
	$input_first_name;
	$input_last_name;
	$input_encrypted_password;
	$input_street_number;
	$input_street_address;
	$input_city;
	$input_postal_code;
	$input_gender;
	$input_dob;
	$input_passport_id;
	
	//return json object, but in array before conversion
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//empty field checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$sql = "INSERT INTO users(`email`, `phone_number`, `first_name`, `last_name`, `encrypted_password`, `street_number`, 
				`street_address`, `city`, `postal_code`, `gender`, `dob`, `passport_id`)
			VALUES('$input_email', '$input_phone_number', '$input_first_name', '$input_last_name', 
				'$input_encrypted_password', '$input_street_number', '$input_street_address', '$input_city', 
				'$input_postal_code', '$input_gender' , '$input_dob', '$input_passport_id')";
			
			$conn->exec($sql);
			
			$return_arr = array(
			'success' => '1',
			'fail_reason' => "None");
			
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