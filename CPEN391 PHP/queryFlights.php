<?php

	/*POST Request Protocol:
	Parameters
		"from": "yyyy-mm-dd" departing from (must be greater than or equal to today) (lower bound of query)
		"until": "yyyy-mm-dd" OR "inf" (upper limit of query)
		"dep_airport": departing airport (Must be 3 letters like YVR or YYC)
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
		check_extract("dep_airport", "dep_airport");
		check_extract("arr_airport", "arr_airport");
		check_extract("from", "from");
		check_extract("until", "until");
	}

	//Database necessary variables
	$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
	$username = "CPEN391Group7";
	$password = "12341234";
	$dbname = "CPEN391db";

	//HTTP Post Req variables
	$dep_airport;
	$arr_airport;
	$from;
	$until;
	
	$return_arr;
	
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		//error checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			
			//if there is no upperbound
			if(strcmp($until, "inf") == 0) {
				
				if(strcmp($arr_airport, "any") == 0) {
					$stmt = $conn->prepare("SELECT * FROM flights WHERE dep_airport='$dep_airport' AND DATE(dep_datetime) >= '$from'"); 
				}
				else {
					$stmt = $conn->prepare("SELECT * FROM flights WHERE dep_airport='$dep_airport' AND arr_airport='$arr_airport' AND 
					DATE(dep_datetime) >= '$from'"); 
				}
			} 
			//if there is an upper bound
			else {
				if(strcmp($arr_airport, "any") == 0) {
					$stmt = $conn->prepare("SELECT * FROM flights WHERE dep_airport='$dep_airport' AND DATE(dep_datetime) >= '$from' AND DATE(dep_datetime) <= '$until'"); 
				}
				else {
					$stmt = $conn->prepare("SELECT * FROM flights WHERE dep_airport='$dep_airport' AND arr_airport='$arr_airport' AND 
					DATE(dep_datetime) >= '$from' AND DATE(dep_datetime) <= '$until'"); 
				}
				
			}
			
			// execute the query
			$stmt->execute();
			
			//fetch all the flights
			$temp = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			$return_arr = array(
				'success' => '1',
				'fail_reason' => "None",
				'flights' => $temp);
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