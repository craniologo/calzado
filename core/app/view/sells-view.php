<section class="content">
	<?php $u=null;
    if(isset($_SESSION["user_id"]) &&$_SESSION["user_id"]!=""):
    $u = UserData::getById($_SESSION["user_id"]);
  	$currency = ConfigurationData::getByPreffix("currency")->val; ?>
	<div class="row">
		<div class="col-md-12">
			<h2><i class='fa fa-usd'></i> Lista de Ventas</h2>
			<div class="clearfix"></div>
		    <?php if($u->kind==1){
		    		$products = SellData::getSells();
		      	}else{
		         	$products = SellData::getSellsByUserId($_SESSION["user_id"]);
		      	} ?>
			<?php if(count($products)>0){ ?>
			<br>
			<div class="box">
	  			<div class="box-body no-padding">
	  				<div class="box-body">
						<div class="box-body table-responsive">
							<table class="table table-bordered datatable table-hover	">
								<thead>
									<th style="text-align: center; width: 30px;">N°</th>
									<th style="text-align: center; width: 30px;">Boleta</th>
									<th style="text-align: center;">Cantidad</th>
									<th style="text-align: center;">Cliente</th>
									<th style="text-align: center;">Total&nbsp;<?php echo $currency; ?></th>
									<th style="text-align: center;">Fecha</th>
									<?php if($u->kind==1):?><th style="text-align: center;">Usuario</th>
									<th style="text-align: center;">Sucursal</th>
									<th style="text-align: center; width: 40px;">Acción</th><?php endif; ?></td>
								</thead>
								<?php for($number = count($products); $number>count($products); $number--); //variable decremental
								foreach($products as $sell):?>
								<tr>
									<td style="text-align: center;"><?php echo $number; ?></td> <?php $number--; ?><!--var decremental-->
									<td style="text-align: right;"><a href="index.php?view=sell_one&id=<?php echo $sell->id; ?>" class="btn btn-xs btn-default"><?php echo "#".$sell->ref_id; ?></a></td>
									<td style="text-align: center;"><?php $operations = OperationData::getAllProductsBySellId($sell->id);
										echo count($operations)." Par(es)"; ?></td>
									<td><?php if($sell->person_id!=""):
										$client = $sell->getPerson(); ?>
										<?php endif; ?>
										<?php if($sell->user_id!=""):
										$user = $sell->getUser(); ?>
										<?php endif; ?><?php echo $client->name." ".$client->lastname;?></td>
									<td style="text-align: right;"><?php $total= $sell->total;
										echo $currency." ".number_format($total,2,".",","); ?></td>
									<td style="text-align: right;"><?php echo $sell->created_at; ?></td>
									<?php if($u->kind==1):?><td><?php $user=UserData::getById($sell->user_id); echo $user->name." ".$user->lastname; ?></td>
									<td><?php $suc = StockData::getById($sell->stock_id); echo $suc->name; ?></td>
									<td style="text-align: center;">
										<a href="index.php?action=sell_del&id=<?php echo $sell->id; ?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a></td><?php endif; ?></td>
								</tr>
								<?php endforeach; ?>
							</table>
						</div>
					</div>
				</div>
			<div class="clearfix"></div>
			<?php }else{ ?>
			<div class="jumbotron">
			<h2>No hay ventas</h2>
			<p>No se ha realizado ninguna venta.</p>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php endif;?>
</section>