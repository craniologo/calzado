<?php
	if(count($_POST)>0){
	  $product = new ColorData();
	  $product->name = $_POST["name"];
	  $product->add();
	  print "<script>window.location='index.php?view=product_new';</script>";
	}
?>