<?php

//This is only for testing I think
echo "Hello world\n";
echo '<pre>'; print_r("sup testing\n"); '</pre>';

$servername = "cpen391db.cctwoqwrey6f.us-west-2.rds.amazonaws.com";
$username = "CPEN391Group7";
$password = "12341234";
$dbname = "CPEN391db";

$input_email = "test2@gmail.com";
try {
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully"; 
	
	$stmt = $conn->prepare("SELECT * FROM users WHERE email='$input_email'"); 
	$stmt->execute();
	
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
	echo '<h1> This is the array format</h1>';
	echo '<pre>' . print_r($result) . '</pre>';
    }
catch(PDOException $e)
    {
    echo "Connection failed: " . $e->getMessage();
    }
	
?>