<?php
	if(count($_POST)>0){
		$user = new PersonData();
		$user->name = $_POST["name"];
		$user->lastname = $_POST["lastname"];
		$user->ruc = $_POST["ruc"];
		$user->address = $_POST["address"];
		$user->phone = $_POST["phone"];
		$user->email = $_POST["email"];
		$user->add_provider();
		print "<script>window.location='index.php?view=re';</script>";
	}
?>