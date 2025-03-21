<section class="content">
  <?php $user = UserData::getById($_GET["id"]);
  if($user->kind==1){
    $t_user = "Administrador";
  }else{
    $t_user = "Ejecutivo";
  } ?>
  <div class="row">
  	<div class="col-md-12">
  	<h2><i class="fa fa-user"></i> Editar <?php echo $t_user; ?></h2>
  	 <a href="index.php?view=users" class="btn btn-default"><i class="fa fa-arrow-left"></i> Regresar</a>
        <br><br>
  		<form class="form-horizontal" method="post" id="addproduct" enctype="multipart/form-data" action="index.php?action=user_update" role="form">
        <div class="form-group">
          <label for="inputEmail1" class="col-lg-2 control-label">Foto JPG (400x400px)</label>
          <div class="col-md-6">
            <?php if($user->image!=""){
              $url = "storage/profiles/".$user->image;
              if(file_exists($url)){
                echo "<img src='$url' style='width:300px;'>";
              }
            }
            ?>
            <br><br>
            <input type="file" name="image" id="image" placeholder="">
          </div>
        </div>
        <div class="form-group">
          <label for="inputEmail1" class="col-lg-2 control-label">Nombre*</label>
          <div class="col-md-3">
            <input type="text" name="name" value="<?php echo $user->name;?>" class="form-control" id="name" placeholder="Nombre">
          </div>
          <label for="inputEmail1" class="col-lg-1 control-label">Apellidos*</label>
          <div class="col-md-3">
            <input type="text" name="lastname" value="<?php echo $user->lastname;?>" required class="form-control" id="lastname" placeholder="Apellido">
          </div>
        </div>
        <div class="form-group">
          <label for="inputEmail1" class="col-lg-2 control-label">Usuario*</label>
          <div class="col-md-3">
            <input type="text" name="username" value="<?php echo $user->username;?>" class="form-control" required id="username" placeholder="Nombre de usuario" readonly>
          </div>
          <label for="inputEmail1" class="col-lg-1 control-label">Correo Electrónico*</label>
          <div class="col-md-3">
            <input type="text" name="email" value="<?php echo $user->email;?>" class="form-control" id="email" placeholder="Correo electrónico">
          </div>
        </div>
        <div class="form-group">
          <label for="inputEmail1" class="col-lg-2 control-label">Contraseña*</label>
          <div class="col-md-3">
            <input type="password" name="password" class="form-control" id="inputEmail1" placeholder="Contraseña" readonly>
            <p class="help-block">La contraseña solo se modificara si escribes algo, en caso contrario no se modifica.</p>
          </div>
          <?php if($user->kind==2 || $user->kind==3){ ?>
          <label for="inputEmail1" class="col-lg-1 control-label">Sucursal</label>
          <div class="col-md-3">
            <select name="stock_id" class="form-control" required>
              <option value="">-- SELECCIONAR --</option>
              <?php foreach(StockData::getAll() as $stock):?>
              <option value="<?php echo $stock->id;?>" <?php if($user->stock_id==$stock->id){ echo "selected"; } ?> ><?php echo $stock->name;?></option>
              <?php endforeach;?>
            </select>
          </div>
        </div>
        <?php }else{ echo '</div>'; } ?>
        <div class="form-group">
          <label type="hidden" for="inputEmail1" class="col-lg-2 control-label" >Esta activo</label>
          <div class="col-md-3">
            <div class="checkbox">
              <label>
                <input type="checkbox" name="status" <?php if($user->status){ echo "checked";}?> > 
              </label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <div class="col-lg-offset-2 col-lg-7">
            <p class="alert alert-info">* Campos obligatorios</p>
          </div>
        </div>
          <input type="hidden" name="user_id" value="<?php echo $user->id;?>">
        <div class="form-group">
          <div class="col-lg-offset-2 col-lg-7">
            <button type="submit" class="btn btn-success">Actualizar Usuario</button>
          </div>
        </div>
      </form>
  	</div>
  </div>
</section>