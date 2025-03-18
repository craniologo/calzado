<section class="content">
  <?php $spend = SpendData::getById($_GET["id"]); ?>
  <div class="row">
  	<div class="col-md-12">
    	<h2><i class="fa fa-coffee"></i> Editar Gasto</h2>
      <a href="./?view=spends" class="btn btn-default"> <i class="fa fa-arrow-left"></i> Regresar</a>
    	<br><br>
  		<form class="form-horizontal" method="post" id="addcategory" action="index.php?action=spend_update" role="form">
        <div class="form-group">
          <label for="inputEmail1" class="col-lg-2 control-label">Concepto*</label>
          <div class="col-md-3">
            <textarea type="text" name="name" required class="form-control" id="name" value="" placeholder="Concepto"><?php echo $spend->name; ?></textarea>
          </div>
          <label for="inputEmail1" class="col-lg-1 control-label">Monto*</label>
          <div class="col-md-2">
            <input type="text" name="price" required class="form-control" id="price" value="<?php echo number_format($spend->price,2,".",","); ?>" placeholder="Costo">
          </div>
        </div>
        <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
        <div class="form-group">
          <div class="col-lg-offset-2 col-lg-10">
            <button type="submit" class="btn btn-primary">Actualizar Gasto</button>
          </div>
        </div>
      </form>
  	</div>
  </div>
</section>