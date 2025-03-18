<?php
	if(count($_POST)>0){
		$user = new PersonData();
		$user->name = $_POST["name"];
		$user->lastname = $_POST["lastname"];
		$user->ruc = $_POST["ruc"];
		$user->address = $_POST["address"];
		$user->email = $_POST["email"];
		$user->phone = $_POST["phone"];
		$user->add_client();
		print "<script>window.location='index.php?view=clients';</script>";
	}
?>