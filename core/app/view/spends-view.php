<section class="content">
	<?php $u=null;
  if(isset($_SESSION["user_id"]) &&$_SESSION["user_id"]!=""):
  $u = UserData::getById($_SESSION["user_id"]);
  $currency = ConfigurationData::getByPreffix("currency")->val; ?>
	<div class="row">
		<div class="col-md-12">
			<h2><i class="fa fa-coffee"></i> Lista de Gastos</h2>
			<a href='#material_new' data-toggle='modal' class='btn btn-primary'><i class='fa fa-coffee'></i> Nuevo Gasto</a>
			<?php if($u->kind==1){
				$users = SpendData::getAll();
			}else{
				$users =SpendData::getAllBYUserId($u->id);
			}
			$total = 0;
			if(count($users)>0){ ?>
			<br><br>
			<div class="box">
			    <div class="box-body no-padding">
			        <div class="box-body table-responsive">
						<table class="table table-bordered datatable table-hover">
							<thead>
								<th style="text-align: center; width: 30px;">N°</th>
								<th style="text-align: center;">Concepto</th>
								<th style="text-align: center;">Monto</th>
								<?php if($u->kind==1):?><th style="text-align: center;">Usuario</th><?php endif; ?>
								<th style="text-align: center;">Fecha</th>
								<th style="text-align: center; width: 150px;">Acción</th>
							</thead>
							<?php for($number=0; $number<1; $number++); //variable incremental
							foreach($users as $user){ ?>
							<tr>
								<td style="text-align: center;"><?php echo $number; ?></td> <?php $number++; ?><!--var incremen-->
								<td><?php echo $user->name; ?></td>
								<td style="text-align: right;"><?php echo $currency." ".number_format($user->price,2,".",","); ?></td>
								<?php if($u->kind==1):?><td><?php $us = UserData::getById($user->user_id); echo $us->name." ".$us->lastname; ?></td><?php endif; ?>
								<td style="text-align: right;"><?php echo $user->created_at; ?></td>
								<td style=" text-align: center;">
									<a href="index.php?view=spend_edit&id=<?php echo $user->id;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Editar</a>
									<a href="index.php?action=spend_del&id=<?php echo $user->id;?>" onclick="return confirm('¿Está seguro de eliminar?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> Eliminar</a></td>
								<?php $total+=$user->price;	} ?>
							</tr>
						</table>
					<h4>Gasto Total : <?php echo $currency." ".number_format($total,2,".",",")?></h4>
					</div>
				</div>
			</div>
			<?php }else{
				echo "<div><br><p class='alert alert-danger'>No hay Gastos</p></div>";
			} ?>
		</div>
	</div>
	<?php endif;?>
</section>

<div class="modal fade" id="material_new"><!--Inicio de ventana modal 2-->
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title" style="text-align: center;">Ingrese el Nuevo Gasto</h4>
        </div>
        <div class="modal-body">
            <table class="table">
              <tr><td>
                <form class="form-horizontal" method="post" id="addtag" action="index.php?action=spend_add" role="form">
                  <div class="form-group">
                    <label for="inputEmail1" class="col-lg-2 control-label">Concepto*</label>
                    <div class="col-md-9">
                      <textarea type="text" name="name" required class="form-control" id="name" placeholder="Concepto del gasto" required="yes"></textarea>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputEmail1" class="col-lg-2 control-label">Monto*</label>
                    <div class="col-md-9">
                      <input type="text" name="price" class="form-control" id="price" placeholder="Monto del gasto" required="">
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <button type="submit" class="btn btn-primary">Registrar Gasto</button>
                    </div>
                  </div>
                </form>
              </td></tr>
            </table>
          </div>
      </div>
    </div>
</div><!--Fin de ventana modal 2-->