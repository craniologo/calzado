<section class="content">
	<div class="row">
		<div class="col-md-12">
			<h2><i class="fa fa-users"></i> Lista de Clientes</h2>
			<a href='#client_new' data-toggle='modal' class='btn btn-primary'><i class='fa fa-users'></i> Nuevo Cliente</a>
			<br><br>
			<?php $users = PersonData::getClients();
			if(count($users)>0){ ?> <!-- si hay usuarios -->
			<div class="box">
				<div class="box-header">
					<div class="box-body no-padding">
						<div class="box-body">
							<div class="box-body table-responsive">
								<table class="table table-bordered datatable table-hover">
									<thead>
										<th style="text-align: center; width: 30px;">N°</th>
										<th style="text-align: center;">Nombre&nbsp;Completo</th>
										<th style="text-align: center;">RUC/DNI</th>
										<th style="text-align: center;">Dirección</th>
										<th style="text-align: center;">Correo&nbsp;Electróncio</th>
										<th style="text-align: center;">Teléfono</th>
										<th style="text-align: center; width:150px;">Acción</th>
									</thead>
									<?php for($number=0; $number<1; $number++); //variable incremental
									foreach($users as $user){ ?>
									<tr>
										<td style="text-align: center;"><?php echo $number; ?></td> <?php $number++; ?><!--var incremen-->
										<td><?php echo $user->name." ".$user->lastname; ?></td>
										<td style="text-align: right;"><?php echo $user->ruc; ?></td>
										<td><?php echo $user->address; ?></td>
										<td><?php echo $user->email; ?></td>
										<td style="text-align: right;"><?php echo $user->phone; ?></td>
										<td style="text-align: center;">
										<a href="index.php?view=client_edit&id=<?php echo $user->id;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Editar</a>
										<a href="index.php?action=client_del&id=<?php echo $user->id;?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Eliminar</a>
										</td>
									</tr>
									<?php } ?>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<?php }else{
				echo "<p class='alert alert-danger'>No hay clientes</p>";
			} ?>
		</div>
	</div>
</section>

<div class="modal fade" id="client_new"><!--Inicio de ventana modal 2-->
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" style="text-align: center;">Ingrese el Nuevo Cliente</h4>
      </div>
      <div class="modal-body">
        <table class="table">
          <tr><td>
            <form class="form-horizontal" method="post" id="addtag" action="index.php?action=client_add" role="form">
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">Nombres*</label>
                <div class="col-md-9">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Nombres del cliente" >
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">Apellidos*</label>
                <div class="col-md-9">
                  <input type="text" name="lastname" class="form-control" id="lastname" placeholder="Apellidos del cliente" >
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">RUC/DNI*</label>
                <div class="col-md-9">
                  <input type="text" name="ruc" class="form-control" id="ruc" placeholder="RUC o DNI del cliente" >
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">Dirección*</label>
                <div class="col-md-9">
                  <input type="text" name="address" class="form-control" id="address" placeholder="Dirección del cliente" >
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">Correo Electrónico*</label>
                <div class="col-md-9">
                  <input type="text" name="email" class="form-control" id="email" placeholder="Correo electrónico del cliente" >
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-2 control-label">Celular*</label>
                <div class="col-md-9">
                  <input type="text" name="phone" class="form-control" id="phone" placeholder="Celular del cliente" >
                </div>
              </div>
              <div class="form-group">
                <div class="col-lg-offset-2 col-lg-10">
                  <button type="submit" class="btn btn-primary">Registrar Cliente</button>
                </div>
              </div>
            </form>
          </td></tr>
        </table>
      </div>
    </div>
  </div>
</div><!--Fin de ventana modal 2-->