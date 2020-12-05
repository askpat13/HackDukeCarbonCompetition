<?php
$username="admin";//change username 
$password="admin"; //change password
$host="localhost";
$db_name="databasename"; //change databasename

$connect=mysqli_connect($host,$username,$password,$db_name);

if(!$connect)
{
	echo json_encode("Connection failed");
}

?>