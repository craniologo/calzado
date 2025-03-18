<section class="content">
	<div class="row">
		<div class="col-md-12">
			<h2><i class="fa fa-building"></i> Lista de Sucursales</h2>
			<a href='#stock_new' data-toggle='modal' class='btn btn-primary'><i class='fa fa-building'></i> Nueva Sucursal</a>
			<br><br>
			<?php $users = StockData::getAll();
			if(count($users)>0){ // si hay usuarios ?>
				<div class="box box-primary">
					<div class="box-body no-padding">
						<div class="box-body">
							<div class="box-body table-responsive">
								<table class="table table-bordered table-hover">
									<thead>
										<th style="text-align: center; width: 30px;">N°</th>
										<th style="text-align: center;">Nombre</th>
										<th style="text-align: center;">Direccion</th>
										<th style="text-align: center;">Telefono</th>
										<th style="text-align: center;">Correo&nbsp;Electrónico</th>
										<th style="text-align: center; width:120px;">Principal</th>
										<th style="text-align: center; width:150px;">Acción</th>
									</thead>
									<?php for ($number=0; $number<1; $number++);
									foreach($users as $user){ ?>
										<tr>
											<td style="text-align: center;"><?php echo $number; ?></td><?php $number++;?>
											<td><a href="index.php?view=inventary&stock=<?php echo $user->id;?>" class="btn btn-default btn-xs"><i class="fa fa-chevron-right"></i><?php echo $user->name; ?></a></td>
											<td><?php echo $user->address; ?></td>
											<td style="text-align: center;"><?php echo $user->phone; ?></td>
											<td><?php echo $user->email; ?></td>
											<td style="text-align: center;">
												<center>
													<?php if($user->is_principal):?>
														<i class="fa fa-check"></i>
														<?php else:?>
															<a href="index.php?action=makestockprincipal&id=<?php echo $user->id;?>" class="btn btn-default btn-xs">Hacer Principal</a>
														<?php endif;?>
													</center>
												</td>
												<td style="text-align: center;"><a href="index.php?view=stock_edit&id=<?php echo $user->id;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Editar</a> <a href="index.php?action=stock_del&id=<?php echo $user->id;?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Eliminar</a></td>
											</tr>
										<?php } ?>
									</table>
								</div>
							</div>
						</div><!-- /.box-body -->
					</div><!-- /.box -->
				<?php }else{
					echo "<p class='alert alert-danger'>No hay Sucursales</p>";
				} ?>
			</div>
		</div>
	</section>

	<div class="modal fade" id="stock_new"><!--Inicio de ventana modal 2-->
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" style="text-align: center;">Ingrese la Nueva Sucursal</h4>
				</div>
				<div class="modal-body">
					<table class="table">
						<tr><td>
							<form class="form-horizontal" method="post" enctype="multipart/form-data" id="addtag" action="index.php?action=stock_add" role="form">
								<div class="form-group">
									<label for="inputEmail1" class="col-lg-2 control-label">Nombre*</label>
									<div class="col-md-9">
										<input type="text" name="name" required class="form-control" id="name" placeholder="Nombre">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail1" class="col-lg-2 control-label">Dirección*</label>
									<div class="col-md-9">
										<input type="text" name="address"  class="form-control" id="name" placeholder="Dirección">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail1" class="col-lg-2 control-label">Teléfono*</label>
									<div class="col-md-9">
										<input type="text" name="phone"  class="form-control" id="name" placeholder="Número de teléfono">
									</div>
								</div>
								<div class="form-group">
									<label for="inputEmail1" class="col-lg-2 control-label">Correo Electrónico*</label>
									<div class="col-md-9">
										<input type="email" name="email"  class="form-control" id="name" placeholder="Correo electrónico">
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button type="submit" class="btn btn-primary">Agregar Sucursal</button>
									</div>
								</div>
							</form>
						</td></tr>
					</table>
				</div>
			</div>
		</div>
</div><!--Fin de ventana modal 2-->