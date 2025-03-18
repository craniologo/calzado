<section class="content"> <!-- Main content -->
	<h2><i class="fa fa-star-half-o"></i> Marcas y Colores</h2>
	<p>Aquí están registrados todos los detalles relacionados a los productos.</p>
	<div class="row">
		<div class="col-md-3">
			<div class="clearfix"></div>
			<?php $color = ColorData::getAll();
			if(count($color)>0){  // si hay usuarios
			?>
			<div class="box">
	  			<div class="box-body no-padding">
	  				<div class="box-body">
	  				<a href="#color_new" class="btn btn-default" data-toggle="modal"><i class='fa fa-tint'></i> Nuevo Color</a>
	  				<div class="box-body table-responsive">
						<table class="table table-bordered datatable table-hover">
							<thead>
								<th style="text-align: center; width: 30px;">N°</th>
								<th style="text-align: center;">Color</th>
								<th style="text-align: center;  width:150px;">Acción</th>
							</thead>
							<?php for ($number=0; $number<1; $number++);?>
							<?php foreach($color as $prd){ ?>
							<tr>
								<td style="text-align: center; width:30px;"><?php echo $number; ?></td><?php $number++;?>
								<td><?php echo $prd->name; ?></td>
								<td style="text-align: center;">
									<a href="index.php?view=color_edit&id=<?php echo $prd->id;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Editar</a>
									<a href="index.php?action=color_del&id=<?php echo $prd->id;?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Eliminar</a>
								</td>
							</tr>
							<?php } ?>
						</table>
					</div>
					</div>
	  			</div><!-- /.box-body -->
			</div><!-- /.box -->
				
			<?php
			}else{
				echo "<p class='alert alert-danger'>Aún no hay colores agregados, agrega uno ya!.</p>";
			}
			?>
		</div>
		<div class="modal fade" id="color_new"><!--Inicio de ventana modal 2-->
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Ingrese el Nuevo Color</h4>
		        </div>
		        <div class="modal-body">
		          	<form class="form-horizontal" method="post" id="" action="index.php?action=color_add" role="form">
		              <div class="form-group">
		                <label for="inputEmail1" class="col-lg-2 control-label">Color*</label>
		                <div class="col-md-6">
		                  <input type="text" name="name" class="form-control" id="name" placeholder="Ingrese el color" required="">
		                </div>
		              </div>
		              <div class="form-group">
		                <div class="col-lg-offset-2 col-lg-10">
		                  <button type="submit" class="btn btn-primary">Agregar Color</button>
		                </div>
		              </div>
		            </form>
		        </div>
		      </div>
		    </div>
		</div><!--Fin de ventana modal 2-->
		<div class="col-md-3">
			<div class="clearfix"></div>
			<?php $brand = BrandData::getAll();
			if(count($brand)>0){  // si hay usuarios
			?>
			<div class="box">
	  			<div class="box-body no-padding">
	  				<div class="box-body">
	  				<a href="#brand_new" class="btn btn-default" data-toggle="modal"><i class='fa fa-tag'></i> Nueva Marca</a>
	  				<div class="box-body table-responsive">
						<table class="table table-bordered datatable table-hover">
							<thead>
								<th style="text-align: center; width: 30px;">N°</th>
								<th style="text-align: center;">Marca</th>
								<th style="text-align: center;  width:150px;">Acción</th>
							</thead>
							<?php for ($number=0; $number<1; $number++);?>
							<?php foreach($brand as $prd){ ?>
							<tr>
								<td style="text-align: center; width:30px;"><?php echo $number; ?></td><?php $number++;?>
								<td><?php echo $prd->name; ?></td>
								<td style="text-align: center;">
									<a href="index.php?view=brand_edit&id=<?php echo $prd->id;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Editar</a>
									<a href="index.php?action=brand_del&id=<?php echo $prd->id;?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Eliminar</a>
								</td>
							</tr>
							<?php } ?>
						</table>
					</div>
					</div>
	  			</div><!-- /.box-body -->
			</div><!-- /.box -->
				
			<?php
			}else{
				echo "<p class='alert alert-danger'>Aún no hay marcas agregadas, agrega una ya!.</p>";
			}
			?>
		</div>
		<div class="modal fade" id="brand_new"><!--Inicio de ventana modal 2-->
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		          <h4 class="modal-title">Ingrese el Nueva Marca</h4>
		        </div>
		        <div class="modal-body">
		          	<form class="form-horizontal" method="post" id="" action="index.php?action=brand_add" role="form">
		              <div class="form-group">
		                <label for="inputEmail1" class="col-lg-2 control-label">Marca*</label>
		                <div class="col-md-6">
		                  <input type="text" name="name" class="form-control" id="name" placeholder="Ingrese la marca" required="">
		                </div>
		              </div>
		              <div class="form-group">
		                <div class="col-lg-offset-2 col-lg-10">
		                  <button type="submit" class="btn btn-primary">Agregar Marca</button>
		                </div>
		              </div>
		            </form>
		        </div>
		      </div>
		    </div>
		</div><!--Fin de ventana modal 2-->
	</div>
</section><!-- /.content -->