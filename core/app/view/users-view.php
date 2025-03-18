<section class="content">
	<div class="row">
		<div class="col-md-12">
			<h2><i class="fa fa-users"></i> Lista de Usuarios</h2>
			<!--<a href="index.php?view=user_new&kind=1" class="btn btn-default"><i class='glyphicon glyphicon-user'></i> Nuevo Administrador</a>
			<a href="index.php?view=user_new&kind=2" class="btn btn-default"><i class='glyphicon glyphicon-user'></i> Nuevo Vendedor</a>-->
			<br>
			<?php $users = UserData::getAll();
			if(count($users)>0){ ?>
			<div class="box box-primary">
				<div class="box-body no-padding">
			  		<div class="box-body">
			  			<div class="box-body table-responsive">
							<table class="table table-bordered datatable table-hover">
								<thead>
									<th style="text-align: center; width: 30px;">N°</th>
									<th style="text-align: center; width: 50px;">Foto</th>
									<th style="text-align: center;">Nombre&nbsp;Completo</th>
									<th style="text-align: center;">Usuario</th>
									<th style="text-align: center;">Correo&nbsp;Electrónico</th>
									<th style="text-align: center;">Sucursal</th>
									<th style="text-align: center;">Activo</th>
									<th style="text-align: center;">Tipo</th>
									<th style="text-align: center; width:80px;">Acción</th>
								</thead>
								<?php for ($number=0; $number<1; $number++);
								foreach($users as $user){ ?>
								<tr>
									<td style="text-align: center;"><?php echo $number; ?></td><?php $number++;?>
									<td style='text-align:center;'>
										<?php
										if($user->image!=""){
											$url = "storage/profiles/".$user->image;
											if(file_exists($url)){
												echo "<img src='$url' style='width:50px;'>";
											}
										} ?></td>
									<td><?php echo $user->name." ".$user->lastname; ?></td>
									<td><?php echo $user->username; ?></td>
									<td><?php echo $user->email; ?></td>
									<td><?php if($user->stock_id!=null){ echo $user->getStock()->name; } ?></td>
									<td style="text-align: center;"><?php if($user->status==1):?>
											<i class="glyphicon glyphicon-ok"></i>
										<?php endif; ?></td>
									<td><?php switch ($user->kind) {
										case '1': echo "Administrador"; break;
										case '2': echo "Vendedor"; break;
										default:
											# code...
											break;
										} ?></td>
									<td style="text-align: center;"><a href="index.php?view=user_edit&id=<?php echo $user->id;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i></a> 
									<a href="index.php?action=user_del&id=<?php echo $user->id;?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i></a></td>
								</tr>
								<?php }	 echo "</table></div>";
								}else{ } ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>