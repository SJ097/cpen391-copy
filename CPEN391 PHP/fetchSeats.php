<?php

	/*POST Request Protocol: Fetches seating status if free or not
	Parameters
		ASSUMES flight_id is valid
		"flight_id": "yyyy-mm-dd" departing from (must be greater than or equal to today) (lower bound of query)
		"class": "first" or "business" or "economy" the class of seatings desired
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
		check_extract("flight_id", "flight_id");
		check_extract("class", "class");
	}
	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$flight_id;
	$class;
	
	$return_arr;
	$sql;
	$row;
	$column;
	$seats_array;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//error checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			//print_r("Connected to database successfully\n"); 
			
			//step 0: Check that the flight exists
			$stmt = $conn->prepare("SELECT fr_cl_seat_max_row, fr_cl_seat_max_column FROM flights WHERE flight_id = '$flight_id'"); 
			$stmt->execute();
			$return_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			//no such flight
			if($stmt->rowCount() == 0) {
				$return_arr = array(
				'success' => '0',
				'fail_reason' => "No such flight");
				echo json_encode($return_arr);
				exit();
			}
			
			//step 1: fetch row and column sizes for the flight
			if(strcmp($class, "first") != 0) {
				$sql = "SELECT fr_cl_seat_max_row, fr_cl_seat_max_column FROM flights WHERE flight_id = '$flight_id'";
				$stmt = $conn->prepare($sql); 
				$stmt->execute();
				//fetch all the flights
				$return_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);
				//extract the rows and columns
				$row = $return_arr[0]['fr_cl_seat_max_row'];
				$column = $return_arr[0]['fr_cl_seat_max_column'];
			}
			elseif(strcmp($class, "business") != 0) {
				$sql = "SELECT bn_cl_seat_max_row, bn_cl_seat_max_column FROM flights WHERE flight_id = '$flight_id'";
				$stmt = $conn->prepare($sql); 
				$stmt->execute();
				//fetch all the flights
				$return_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);
				//extract the rows and columns
				$row = $return_arr[0]['bn_cl_seat_max_row'];
				$column = $return_arr[0]['bn_cl_seat_max_column'];
			}		
			elseif(strcmp($class, "economy") != 0) {
				$sql = "SELECT econ_cl_seat_max_row, econ_cl_seat_max_column FROM flights WHERE flight_id = '$flight_id'";
				$stmt = $conn->prepare($sql); 
				$stmt->execute();
				//fetch all the flights
				$return_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);
				//extract the rows and columns
				$row = $return_arr[0]['econ_cl_seat_max_row'];
				$column = $return_arr[0]['econ_cl_seat_max_column'];
			}			
			else {
				$return_arr = array(
				'success' => '0',
				'fail_reason' => "'class' parameter is not 'first', 'business' or 'economy'");
				echo json_encode($return_arr);
				exit();
			}
			
			//create array with all 1 indicating available
			$seats_array = array_fill(0, $row * $column, 1);
			
			//step 2: Fetch taken seats for each class that are NOT cancelled
			$stmt = $conn->prepare("SELECT R.seat_num FROM flights F, reservations R WHERE R.flight_id = F.flight_id AND R.class = '$class' AND R.status = 'made'"); 
			$stmt->execute();
			
			//fetch all the taken seats
			$return_arr = $stmt->fetchAll(PDO::FETCH_ASSOC);

			foreach($return_arr as $subarray) {
				$taken_seat_index = $subarray["seat_num"];
				$seats_array[$taken_seat_index] = 0;	//indicate not available seat by using 0
			}
			
			$return_arr = array(
				'success' => '1',
				'fail_reason' => "None",
				'seats' => $seats_array);
			echo json_encode($return_arr, JSON_FORCE_OBJECT);
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