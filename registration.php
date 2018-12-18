<?php
	include '../conn.php';
	$name=$_REQUEST['um_name'];
	$psw=md5($_REQUEST['um_psw']);
	$cnct=$_REQUEST['um_cnct'];
	$mail=$_REQUEST['um_mail'];

	$response=array();
	
	$login=mysqli_query($con,"INSERT INTO `user_info`(`um_name`, `um_cnct`, `um_mail`, `um_psw`, `um_regdate`) VALUES ('".$name."', '".$cnct."', '".$mail."', '".$psw."', now())") or die(mysqli_error($con));
	
	if(mysqli_insert_id($con)!=0)
	{
		$response['success']=200;
		$response['message']="Login Successful";
	}
	else
	{
		$response['success']=201;
		$response['message']="UserID or Password Incorrect";
	}
	echo json_encode($response);
?>