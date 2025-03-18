<?php
	if(count($_POST)>0){
		$product = SpendData::getById($_POST["id"]);
		$product->name = $_POST["name"];
		$product->price = $_POST["price"];
		$product->user_id = $_SESSION["user_id"];
		$product->update();
		setcookie("prdupd","true");
		print "<script>window.location='index.php?view=spends';</script>";
	}
?>			