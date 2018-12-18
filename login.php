<?php
	include '../conn.php';
	$user=$_REQUEST['um_mail'];
	$psw=$_REQUEST['um_psw'];
	
	$login=mysqli_query($con, "select * from user_info where um_mail='".$user."' or um_mail='".$user."' and um_psw='".$psw."'") or die(mysqli_error($con));
	$response=array();
	if(mysqli_num_rows($login)!=0)
	{
		$response['success']=200;
		$log=mysqli_fetch_array($login);
		$response['data']=$log;
		$response['message']="Login Successful";
	}
	else
	{
		$response['success']=201;
		$response['message']="UserID or Password Incorrect";
	}
	echo json_encode($response);
?>