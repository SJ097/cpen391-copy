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
		check_extract("passport_id", "passport_id");
		check_extract("dep_airport", "dep_airport");
	}
	
	//not used, but useful in the future
	function giveCurrentDatetime() {
		$today_array = getdate();
		$today;
		
		if($today_array['hours'] < 7) {
			$today = new DateTime($today_array['year'] . "-" . $today_array['mon'] . "-" . $today_array['mday'] . 
			" " . (24-(7-$today_array['hours'])) . ":" . $today_array['minutes'] . ":" . $today_array['seconds']);
			date_sub($today, date_interval_create_from_date_string('1 day'));
		}
		else {
			$today = new DateTime($today_array['year'] . "-" . $today_array['mon'] . "-" . $today_array['mday'] . 
			" " . ($today_array['hours']-7) . ":" . $today_array['minutes'] . ":" . $today_array['seconds']);
		}
		return $today;
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
		
		//error checking of input fields
		check_all_inputs();
		
		try {
			$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
			// set the PDO error mode to exception
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				
			$today = giveCurrentDatetime();
			$tomorrow = giveCurrentDatetime();
			date_add($tomorrow, date_interval_create_from_date_string('1 day'));
			
			$todayString = $today->format('Y-m-d H:i:s');
			$tomorrowString = $tomorrow->format('Y-m-d H:i:s');
			
			//if you want the 24 hours constraint. Turn this on for the real demo

			//$stmt = $conn->prepare("select reservation_id, seat_num, class, 
			//flyer_fname, flyer_lname, flyer_dob, flyer_phone_number,
			//dep_city, dep_airport, dep_datetime, arr_city, arr_airport, arr_datetime
			//from reservations natural join flights where flyer_passport_id='$passport_id' and checkedIn='0' 
			//and status='made' and dep_datetime<='$tomorrowString' and dep_datetime>='$todayString' and arr_datetime>'$todayString' and dep_airport='$dep_airport'");
			
			//NOTE: passportID and dep_airport and status is NOT unique
			
			$stmt = $conn->prepare("select reservation_id, seat_num, class, flyer_fname, flyer_lname, flyer_dob, flyer_phone_number, 
			dep_city, dep_airport, dep_datetime, arr_city, arr_airport, arr_datetime
			from reservations natural join flights where flyer_passport_id='$passport_id' and checkedIn='0' 
			and status='made' and dep_datetime>='$todayString' and arr_datetime>'$todayString' and dep_airport='$dep_airport' limit 5");
			
			// execute the query
			$stmt->execute();
			
			//fetch all the flights
			$reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			//no reservations found
			if($stmt->rowCount() == 0) {
				//this means no reservation is available or that passport ID is not valid
				echo "$0";
				exit();
			}
			
			echo '$';	//start scan character
			foreach($reservations as $each_reser) {
				echo '@' . 
				$each_reser['reservation_id'] . '^' .		
				$each_reser['seat_num'] . '^' .	
				$each_reser['class'] . '^' .
				$each_reser['flyer_fname'] . '^' .		
				$each_reser['flyer_lname'] . '^' .		
				$each_reser['flyer_dob'] . '^' .				
				$each_reser['flyer_phone_number'] . '^' .							
				$each_reser['dep_city'] . '^' .
				$each_reser['dep_airport'] . '^' .	
				$each_reser['dep_datetime'] . '^' .	
				$each_reser['arr_city'] . '^' .
				$each_reser['arr_airport'] . '^' .	
				$each_reser['arr_datetime'];
			}
			echo '$';
		}
		catch(PDOException $e)
		{
			echo $e->getMessage();
		}
	}

?>