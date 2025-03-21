<?php $clients = PersonData::getClients(); ?>
<section class="content">
	<div class="row">
		<div class="col-md-12">
		<h2>Ganancia Real (Sólo artículos vendidos)</h2>
		<h3>Precio de venta - Precio de compra = Ganancia real</h3>
			<form>
				<input type="hidden" name="view" value="gain">
				<div class="row">
					<div class="col-md-3">
						<input type="date" name="sd" value="<?php if(isset($_GET["sd"])){ echo $_GET["sd"]; }?>" class="form-control">
					</div>
					<div class="col-md-3">
						<input type="date" name="ed" value="<?php if(isset($_GET["ed"])){ echo $_GET["ed"]; }?>" class="form-control">
					</div>
					<div class="col-md-2">
						<input type="submit" class="btn btn-success btn-block" value="Procesar">
					</div>
				</div>
			</form>
		</div>
	</div>
	<br><!--- -->
	<div class="row">
		<div class="col-md-12">
			<?php if(isset($_GET["sd"]) && isset($_GET["ed"]) ):?>
			<?php if($_GET["sd"]!=""&&$_GET["ed"]!=""):
			$sd = strtotime($_GET["sd"]);
			$ed = strtotime($_GET["ed"]); ?>
			<div class="box box-primary">
				<div class="box-body no-padding">
			  		<div class="box-body">
			  			<div class="box-body table-responsive">
							<div id="graph" class="animate" data-animate="fadeInUp" ></div>
						</div>
					</div>
				</div>
			</div>
			
			<script>
			<?php 
			echo "var c=0;";
			echo "var dates=Array();";
			echo "var data=Array();";
			echo "var total=Array();";
			for($i=$sd;$i<=$ed;$i+=(60*60*24)){
			  $operations = SellData::getGroupByDateOp(date("Y-m-d",$i),date("Y-m-d",$i),2);
			  $res = SellData::getGroupByDateOpC(date("Y-m-d",$i),date("Y-m-d",$i),2);
			  //echo $res[0]->tot;
			  //echo $operations[0]->t;
			  $sr = $res[0]->tot!=null?$res[0]->tot:0;
			  $sl = $operations[0]->t!=null?$operations[0]->t:0;
			  echo "dates[c]=\"".date("Y-m-d",$i)."\";";
			  echo "data[c]=".($sl-$sr).";";
			  echo "total[c]={x: dates[c],y: data[c]};";
			  echo "c++;";
			}
			?>
			// Use Morris.Area instead of Morris.Line
			Morris.Area({
			  element: 'graph',
			  data: total,
			  xkey: 'x',
			  ykeys: ['y',],
			  labels: ['Y']
			}).on('click', function(i, row){
			  console.log(i, row);
			});
			</script>
			<div class="box box-primary">
				<div class="box-body no-padding">
			  		<div class="box-body">
			  			<div class="box-body table-responsive">
							<table class="table table-bordered">
								<thead>
									<th style="text-align: center;">N°</th>
									<th style="text-align: center;">Fecha</th>
									<th style="text-align: center;">Monto&nbsp;Venta</th>
									<th style="text-align: center;">Monto&nbsp;Compra</th>
									<th style="text-align: center;">Ganancia&nbsp;Real</th>
								</thead>
								<?php for ($number=0; $number<1; $number++);
								$restotal=0;
								$selltotal = 0;
								for($i=$sd;$i<=$ed;$i+=(60*60*24)):
								$operations = SellData::getGroupByDateOp(date("Y-m-d",$i),date("Y-m-d",$i),2);
								$res = SellData::getGroupByDateOpC(date("Y-m-d",$i),date("Y-m-d",$i),2); ?>
								<?php if(count($operations)>0):?>
								<?php // foreach($operations as $operation):?>
								<tr>
									<td style="text-align: center;"><?php echo $number; ?></td><?php $number++;?>
									<td style="text-align: center;"><?php echo date("Y-m-d",$i); ?></td>
									<td style="text-align: right;">S/ <?php echo number_format($operations[0]->t,2,'.',','); ?></td>
									<td style="text-align: right;">S/ <?php echo number_format($res[0]->tot,2,'.',','); ?></td>
									<td style="text-align: right;">S/ <?php echo number_format($operations[0]->t-($res[0]->tot),2,'.',','); ?></td>
								</tr>
								<?php $restotal+= ($res[0]->tot);
								$selltotal+= ($operations[0]->t);
								// endforeach; ?>
								<?php else: ?>
								<div class="jumbotron">
									<h2>No hay operaciones</h2>
									<p>El rango de fechas seleccionado no proporciono ningun resultado de operaciones.</p>
								</div>
								<?php endif; ?>
								<?php endfor;?>
								<tr>
									<td></td>
									<td style="text-align: center;"><b>Total</b></td>
									<td style="text-align: right;"><b>S/ <?php echo number_format($selltotal,2,'.',','); ?></b></td>
									<td style="text-align: right;"><b>S/ <?php echo number_format($restotal,2,'.',','); ?></b></td>
									<td style="text-align: right;"><b>S/ <?php echo number_format($selltotal-($restotal),2,'.',','); ?></b></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<?php else:?>
			<div class="jumbotron">
				<h2>Fecha Incorrectas</h2>
				<p>Puede ser que no selecciono un rango de fechas, o el rango seleccionado es incorrecto.</p>
			</div>
		<?php endif;?>
		<?php endif; ?>
		</div>
	</div>
</section>