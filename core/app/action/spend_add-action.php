<?php
	if(count($_POST)>0){
		$user = new SpendData();
		$user->name = $_POST["name"];
		$user->price = $_POST["price"];
		$user->user_id = $_SESSION["user_id"];
		$user->add();
		print "<script>window.location='index.php?view=spends';</script>";
	}
?>