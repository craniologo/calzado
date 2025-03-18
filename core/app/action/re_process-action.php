<?php
	if(isset($_SESSION["reabastecer"])){
		$cart = $_SESSION["reabastecer"];
		if(count($cart)>0){

	$admin = UserData::getById($_SESSION['user_id']);

	$process = true;

	//////////////////////////////////
			if($process==true){
				$sell = new SellData();
				$sell->ref_id = $_POST["ref_id"];
				$sell->user_id = $admin->id;
				$sell->total = $_POST["money1"];
				$sell->stock_id = $_POST["stock_id"];
				 if(isset($_POST["client_id"]) && $_POST["client_id"]!=""){
				 	$sell->person_id=$_POST["client_id"];			 	
	 				$s = $sell->add_re_with_client();
				 }else{
	 				$s = $sell->add_re();
				 }


			foreach($cart as  $c){


				$op = new OperationData();
				$op->product_id = $c["product_id"] ;
				$op->stock_id = $_POST["stock_id"];
				$op->operation_type_id=1; // 1 - entrada
				$op->q= $c["q"];
				$op->size_id=$c["size_id"];
				$op->price_in = "NULL";
	        	$op->price_out = "NULL";
				$op->sell_id=$s[1];
				$add = $op->add();			 		

			}
				unset($_SESSION["reabastecer"]);
				setcookie("selled","selled");
			////////////////////
			print "<script>window.location='index.php?view=re_one&id=$s[1]';</script>";
			}
		}
	}
?>