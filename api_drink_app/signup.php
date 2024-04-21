<?php
include "connection.php";

$userID = $_POST['user_id'] ;
$userName = $_POST['user_name'] ;
$userEmail = $_POST['user_email'] ;
$userPassword = md5($_POST['user_password']);

$sqlQuery = "INSERT INTO `user_table`(`user_id`, `user_name`, `user_email`, `user_password`) VALUES ('[$userID]','[$userName]','[$userEmail]','[$userPassword]')";
$resultOfQuery = $connectNow->query($sqlQuery);
if($resultOfQuery)
{
    echo json_encode(array("success"=>true));
}
else
{
    echo json_encode(array("success"=>false));
}