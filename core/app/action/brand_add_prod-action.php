<?php
	if(count($_POST)>0){
	  $product = new BrandData();
	  $product->name = $_POST["name"];
	  $product->add();
	  print "<script>window.location='index.php?view=product_new';</script>";
	}
?>