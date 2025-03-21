<section class="content">
  <div class="row">
  	<div class="col-md-12"><!-- Single button -->
  		<h2><i class="glyphicon glyphicon-stats"></i> Inventario Global</h2>
        <ol class="breadcrumb">
          <li><a href="./?view=home">Inicio</a></li>
          <li><a href="./?view=stocks">Sucursales</a></li>
        </ol>
      <?php $products = ProductData::getAll();
      $sucursales = StockData::getAll();
      if(count($products)>0){ ?>
      <div class="box">
        <div class="box-body no-padding">
          <div class="box-body">
            <div class="box-body table-responsive">
              <table class="table table-bordered datatable table-hover">
              	<thead>
                  <th style="text-align: center; width: 30px;">N°</th>
              		<th style="text-align: center; width: 100px;">Codigo</th>
              		<th style="text-align: center;">Nombre</th>
                  <th style="text-align: center;">Talla</th>
                  <th style="text-align: center;">Stock Total Real</th>
                  <th style="text-align: center;">Ubi-Suc-Principal</th>
                  <?php foreach($sucursales as $suc):?>
              		<th style="text-align: center;"><?php echo $suc->name; ?></th>
                  <?php endforeach; ?>
              	</thead>
              	<?php for($number=0; $number<1; $number++); //variable incremental
                foreach($products as $product):
                $stk_true=OperationData::getQYesF($product->id); ?>
              	<tr>
                  <td style="text-align: center;"><?php echo $number; ?></td> <?php $number++; ?><!--var incremen-->
              		<td style="text-align: right;"><?php echo $product->barcode; ?></td>
              		<td><?php echo $product->modelo; ?></td>
                  <td style="text-align: center;"><?php $size = Serie_sizeData::getById($product->size_id); echo "Talla ".$size->size; ?></td>
                  <td style="text-align: center;"><?php echo $stk_true; ?></td>
                  <td><?php echo $product->ubication; ?></td>
                  <?php foreach($sucursales as $suc):?>
              		<td style="text-align: center;">
              			<?php $q=OperationData::getQByStock($product->id,$suc->id);
                    if($q<0){
                      echo "Se vendió ".$q*(-1)." prod. de Sucursal Principal";
                    }else{
                      echo "Queda ".$q." prod.";
                    }; ?>
                    
              		</td>
                  <?php endforeach; ?>
              	</tr>
              	<?php endforeach;?>
              </table>
            </div>
          </div>
        </div><!-- /.box-body -->
      </div><!-- /.box -->
    	<?php }else{ ?>
    	<div class="jumbotron">
    		<h2>No hay productos</h2>
    		<p>No se han agregado productos, ve a Catálogos/Productos y luego <b>"Nuevo Producto"</b>.</p>
    	</div>
    	<?php } ?>
      <br>
  	</div>
  </div>
</section>