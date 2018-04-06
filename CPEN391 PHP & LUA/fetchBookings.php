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
			
			$stmt = $conn->prepare("SELECT reservation_id, user_id, flyer_passport_id, flight_id, class, checkedIn, seat_num, status, 
				flyer_fname, flyer_lname, flyer_street_number, flyer_street_address, flyer_city, flyer_postal_code, flyer_gender, flyer_dob, flyer_phone_number, flyer_email,
				dep_city, dep_airport, dep_datetime, arr_city, arr_airport, arr_datetime
				FROM reservations R NATURAL JOIN flights F WHERE R.user_id = '$user_id'"); 
			
			// execute the query
			$stmt->execute();
			
			//fetch all the flights
			$reservations = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			//separate reservations into two arrays.
			//one: ongoing reservations
			//two: past reservations
			//three: cancelled reservations
			
			$ongoing_reser = array();
			$cancelled_reser = array();
			$past_reser = array();
			
			$today_array = getdate();
			
			if($today_array['hours'] < 7) {
				$today = new DateTime($today_array['year'] . "-" . $today_array['mon'] . "-" . $today_array['mday'] . 
				" " . (24-(7-$today_array['hours'])) . ":" . $today_array['minutes'] . ":" . $today_array['seconds']);
				date_sub($today, date_interval_create_from_date_string('1 day'));
			}
			else {
				$today = new DateTime($today_array['year'] . "-" . $today_array['mon'] . "-" . $today_array['mday'] . 
				" " . ($today_array['hours']-7) . ":" . $today_array['minutes'] . ":" . $today_array['seconds']);
			}
			
			foreach($reservations as $each_reser) {
				//cancelled
				if(strcmp($each_reser['status'], "cancelled") == 0) {
					array_push($cancelled_reser, $each_reser);
				}
				//ongoing bookings can't miss a booking in the past
				elseif(new DateTime($each_reser['dep_datetime']) > $today) {
					array_push($ongoing_reser, $each_reser);
				}
				//past bookings
				else {
					array_push($past_reser, $each_reser);
				}
			}
			
			$return_arr = array(
				'success' => '1',
				'fail_reason' => "None",
				'ongoing_reservations' => $ongoing_reser,
				'past_reservations' => $past_reser,
				'cancelled_reservations' => $cancelled_reser);
				
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