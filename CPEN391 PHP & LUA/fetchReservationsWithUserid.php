<?php

	/*POST Request Protocol: Fetches all reservations for a given user
	In the future I can change it so that we have different URLs for fetching different kind of reservations: ex. past, cancelled, current reservations
	Parameters
		"user_id": "yyyy-mm-dd" departing from (must be greater than or equal to today) (lower bound of query)
	*/
	
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
	}

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$user_id;
	
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//error checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			//print_r("Connected to database successfully\n"); 
			
			$stmt = $conn->prepare("SELECT * FROM reservations WHERE user_id = '$user_id'"); 
			
			// execute the query
			$stmt->execute();
			
			//fetch all the flights
			$temp = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			$return_arr = array(
				'success' => '1',
				'fail_reason' => "None",
				'seats' => $temp);
			
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