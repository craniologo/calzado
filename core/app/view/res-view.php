<section class="content">
	<?php $u=null;
    if(isset($_SESSION["user_id"]) &&$_SESSION["user_id"]!=""):
    $u = UserData::getById($_SESSION["user_id"]);
    $currency = ConfigurationData::getByPreffix("currency")->val; ?>
	<div class="row">
		<div class="col-md-12">
			<h2><i class='fa fa-refresh'></i> Lista de Reabastecimientos</h2>
			<a href="index.php?view=re" class="btn btn-primary"><i class='fa fa-refresh'></i> Reabastecer</a>
			<br><br>
			<?php $products = SellData::getRes();
			if(count($products)>0){ ?>
			<div class="box">
	  			<div class="box-body no-padding">
	  				<div class="box-body">
	  					<div class="box-body table-responsive">
							<table class="table table-bordered datatable table-hover	">
								<thead>
									<th style="text-align: center; width:30px;">N°</th>
									<th style="text-align: center; width:30px;">Guía</th>
									<th style="text-align: center;">Cant</th>
									<th style="text-align: center;">Proveedor</th>
									<th style="text-align: center;">Total&nbsp;<?php echo $currency; ?></th>
									<th style="text-align: center;">Fecha</th>
									<th style="text-align: center; width:30px;">Acción</th>
								</thead>
								<?php for ($number=0; $number<1; $number++);
								foreach($products as $sell):?>
								<tr>
									<td style="text-align: center; width:30px;"><?php echo $number; ?></td><?php $number++;?>
									<td style="text-align: right;"><a href="index.php?view=re_one&id=<?php echo $sell->id; ?>" class="btn btn-xs btn-default"><?php echo $sell->ref_id; ?></a></td>
									<td style="text-align: right;"><?php $operations = OperationData::getAllProductsBySellId($sell->id);
										echo count($operations); ?></td>
									<td><?php $person = PersonData::getById($sell->person_id); echo $person->name." ".$person->lastname; ?></td>
									<td style="text-align: right;"><?php $total=0;
										foreach($operations as $operation){
										$product  = $operation->getProduct();
										$total += $operation->q*$product->price_in; }; 
										echo $currency.' '.number_format($total,2,".",",")."</b>"; ?></td>
									<td style="text-align: right;"><?php echo $sell->created_at; ?></td>
									<td style="text-align: center;"><a href="index.php?action=re_del&id=<?php echo $sell->id; ?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-xs btn-danger"><i class="fa fa-trash"></i></a></td>
								</tr>
							<?php endforeach; ?>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php }else{ ?>
			<div class="jumbotron">
				<h2>No hay datos</h2>
				<p>No se ha realizado ninguna operacion.</p>
			</div>
			<?php } ?>
		</div>
	</div>
	<?php endif; ?>
</section>