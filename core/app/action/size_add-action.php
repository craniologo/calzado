<?php
	if(count($_POST)>0){
	  $size = new Serie_sizeData();
	  $size->serie_id = $_POST["serie_id"];
	  $size->size = $_POST["size"];
	  $size->add();
	  print "<script>window.location='index.php?view=serie_size';</script>";
	}
?>