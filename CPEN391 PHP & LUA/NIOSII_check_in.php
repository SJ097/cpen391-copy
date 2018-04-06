<?php
	/*POST Request Protocol:
	
	Server returns a JSON Object consisting of
	-(JSON Array containing JSON objects of) not checked in and future reservations given passportID within 24 hour period from a departing airport
	
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
		check_extract("reservation_id", "reservation_id");
	}
	
	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$passport_id;
	$dep_airport;
	
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//empty field checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			$stmt = $conn->prepare("select * from reservations where reservation_id='$reservation_id'");
			
			// execute the query
			$stmt->execute();
			
			//fetch all the flights
			$reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			//WARNING: NIOS expects these values to be like this in this specific order. You cannot change the order
			//here without changing the order in NIOS
			
			//no reservations found
			if($stmt->rowCount() == 0) {
				echo '$0$';
				die();
			}
			
			//Such reservation exists
			//Change the checkIn status
			
			$sql = "UPDATE reservations SET checkedIn='1' WHERE reservation_id='$reservation_id'";
		
			// Prepare statement
			$stmt = $conn->prepare($sql);
		
			// execute the query
			$stmt->execute();
			
			echo '$1$';		//echo success
		}
		catch(PDOException $e)
		{
			echo $e->getMessage();
		}
	}

?>