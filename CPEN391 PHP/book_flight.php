<?php
	/*IMPORTANT NOTE. PLEASE READ: 
	1) This script assumes the front end checks the valid fields before HTTP Post request is sent
		a) assumes that client originally fetches empty seats and therefore sends valid 'seat_num'
	*/

	//this function is from w3schools.com
	//removes special characters in the input and whitespace
	function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
	
	//Note: If you want to run your own check functions, run them individually after check_all_inputs
	//Functionality: checks a single POST parameter to see if it's empty and extracts the data
	//Inputs: 
	//		1) parameter name is the name of the POST request parameter to check its emptiness
	//		2) success variable name is the variable name of the variable you want to extract the POST param value into
	function empty_check_extract($POST_param_name, $success_variable_name) {
		if (!isset($_POST["$POST_param_name"])) {
			$return_arr = array(
				'success' => '0',
				'fail_reason' => "'$POST_param_name' field is required");
			echo json_encode($return_arr);
			die();		
		} else {
			$GLOBALS["$success_variable_name"] = test_input($_POST["$POST_param_name"]);
		}
	}
	
	//checks the inputs if they're empty or not
	//Functionality: if correct inputs, it stores the correct inputs in the global variables
	//		if not correct, script ends
	function emptiness_check_all_inputs() {
		empty_check_extract("user_id", "user_id");
		empty_check_extract("flight_id", "flight_id");
		empty_check_extract("seat_num", "seat_num");
		empty_check_extract("flyer_fname", "flyer_fname");
		empty_check_extract("flyer_lname", "flyer_lname");
		empty_check_extract("flyer_street_number", "flyer_street_number");
		empty_check_extract("flyer_street_address", "flyer_street_address");
		empty_check_extract("flyer_city", "flyer_city");
		empty_check_extract("flyer_postal_code", "flyer_postal_code");
		empty_check_extract("flyer_gender", "flyer_gender");
		empty_check_extract("flyer_dob", "flyer_dob");
		empty_check_extract("flyer_phone_number", "flyer_phone_number");
		empty_check_extract("flyer_email", "flyer_email");
		empty_check_extract("class", "class");
		empty_check_extract("class", "class");
		empty_check_extract("flyer_passport_id", "flyer_passport_id");
	}

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$user_id;
	$flight_id;
	$seat_num;
	$class;
	$flyer_fname;
	$flyer_lname;
	$flyer_street_number;
	$flyer_street_address;
	$flyer_city;
	$flyer_postal_code;
	$flyer_gender;
	$flyer_dob;
	$flyer_phone_number;
	$flyer_email;
	$flyer_passport_id;		

	//return json object, but in array before conversion
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//error checking of input fields
		emptiness_check_all_inputs();
		
		//To do:
		//IMPORTANT! Need to check that this seat number and flight_id must be unique!
		//Problem right now: Multiple reservation with same seat_num, same class, same flight_id are being booked
		//hacky solution: Ensure app only books flights based on the php function that fetches available seats
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$sql = "INSERT INTO reservations(`flyer_passport_id`, `user_id`, `flight_id`, `seat_num`, `class`, `status`, `checkedIn`, `flyer_fname`, `flyer_lname`, `flyer_street_number`, `flyer_street_address`, `flyer_city`, `flyer_postal_code`, 
			`flyer_gender`, `flyer_dob`, `flyer_phone_number`, `flyer_email`)
			VALUES('$flyer_passport_id', '$user_id', '$flight_id', '$seat_num', '$class', 'made', '0', '$flyer_fname', '$flyer_lname', '$flyer_street_number', '$flyer_street_address', '$flyer_city', '$flyer_postal_code', 
			'$flyer_gender' , '$flyer_dob', '$flyer_phone_number', '$flyer_email')";
			
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