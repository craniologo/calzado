<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>SISTEMA | MIZAPATILLA</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.4 -->
    <link href="plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="plugins/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="plugins/dist/css/skins/skin-blue-light.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="plugins/datatables/dataTables.bootstrap.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="plugins/jquery/jquery-2.1.4.min.js"></script>
    <script src="plugins/morris/raphael-min.js"></script>
    <script src="plugins/morris/morris.js"></script>
    <link rel="stylesheet" href="plugins/morris/morris.css">
    <link rel="stylesheet" href="plugins/morris/example.css">
    <script src="plugins/jspdf/jspdf.min.js"></script>
    <script src="plugins/jspdf/jspdf.plugin.autotable.js"></script>
    <?php if(isset($_GET["view"]) && $_GET["view"]=="sell"):?>
    <script type="text/javascript" src="plugins/jsqrcode/llqrcode.js"></script>
    <script type="text/javascript" src="plugins/jsqrcode/webqr.js"></script>
    <?php endif;?>

  </head>

  <body class="<?php if(isset($_SESSION["user_id"]) || isset($_SESSION["client_id"])):?>  skin-blue-light sidebar-mini <?php else:?>login-page<?php endif; ?>"
    style="background-image: url('storage/background.jpg'); background-size: cover;">
    <div class="wrapper">
      <!-- Main Header -->
      <?php if(isset($_SESSION["user_id"]) || isset($_SESSION["client_id"])):?>
      <header class="main-header">
        <!-- Logo -->
        <a href="./" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"><b>M</b>Z</span>
          <!-- logo for regular state and mobile devices -->
          <span class="logo-lg">MI<b>&nbsp;ZAPATILLA</b></span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>
          <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">

              <?php if(isset($_SESSION["user_id"])):
              $msgs = MessageData::getUnreadedByUserId($_SESSION["user_id"]); ?>
                  
              <li class="dropdown notifications-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-warning"></i>
                  <span class="label label-warning">?</span>
                </a>
                <ul class="dropdown-menu">
                  <li class="header">Guías y Manuales</li>
                  <li class="footer"><a href="https://www.sergestec.com/download/manual_sistema_calzado.pdf" target="_blank"><i class="fa fa-book"></i> Manual de usuario</a></li>
                  <li class="header">Sugerencias y Mejoras del Sistema</li>
                  <li class="footer"><a href="http://soporte.sergestec.com" target="_blank"><i class="fa fa-ticket"></i> Ir al sistema de tickets</a></li>
                </ul>
              </li>

              <ul class="dropdown-menu">
                <li class="header">Tienes <?php echo count($msgs);?> mensajes nuevos</li>
                <li>
                  <!-- inner menu: contains the actual data -->
                  <ul class="menu">
                  <?php foreach($msgs as $i):?>
                    <li><!-- start message -->
                      <a href="./?view=messages&opt=open&code=<?php echo $i->code;?>">
                        <h4>
                      <?php if($i->user_from!=$_SESSION["user_id"]):?>
                      <?php $u = $i->getFrom(); echo $u->name." ".$u->lastname;?>
                      <?php elseif($i->user_to!=$_SESSION["user_id"]):?>
                      <?php $u = $i->getTo(); echo $u->name." ".$u->lastname;?>
                    <?php endif; ?>
                          <small><i class="fa fa-clock-o"></i> 5 mins</small>

                        </h4>
                        <p><?php echo $i->message; ?></p>
                      </a>
                    </li>
                  <?php endforeach; ?>
   
                  </ul>
                </li>
                <li class="footer"><a href="./?view=messages&opt=all">Todos los mensajes</a></li>
              </ul>
              <?php endif;?>
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class=""><?php if(isset($_SESSION["user_id"]) ){ echo UserData::getById($_SESSION["user_id"])->name; 
                  if(Core::$user->kind==1){ echo " (Administrador)"; }
                  else if(Core::$user->kind==2){ echo " (Ejecutivo)"; }
                  else if(Core::$user->kind==3){ echo " (Almacenista)"; }
                  }else if (isset($_SESSION["client_id"])){ echo PersonData::getById($_SESSION["client_id"])->name." (Cliente)" ;}?> <b class="caret"></b> </span>
                </a>
                <ul class="dropdown-menu">
              <li class="user-header">
                <?php if(Core::$user->image!=""){
                $url = "storage/profiles/".Core::$user->image;
                if(file_exists($url)){
                  echo "<img src='$url' class='img-circle'>";
                } } ?>
                <p>
                <?php echo Core::$user->name." ".Core::$user->lastname;?>
                </p>
              </li>                  <!-- The user image in the menu -->
                  <!-- Menu Footer-->
                  <li class="user-footer">
                    <div class="pull-right">
                      <a href="./?view=profile" class="btn btn-default btn-flat">Mi Perfil</a>
                      <a href="./logout.php" class="btn btn-default btn-flat">Salir</a>
                    </div>
                  </li>
                </ul>
              </li>
              <!-- Control Sidebar Toggle Button -->
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header">ADMINISTRACION</li>
            <?php if(isset($_SESSION["user_id"])):?>
            <?php if(Core::$user->kind==2):?>
            <li><a href="./index.php?view=alerts"><i class='fa fa-bell-o'></i> <span>Alertas</span></a></li>
            <li><a href="./index.php?view=sell"><i class='fa fa-shopping-cart'></i> <span>Vender</span></a></li>
            <li><a href="./index.php?view=sells"><i class='fa fa-usd'></i> <span>Ventas</span></a></li>
            <li><a href="index.php?view=clients"><i class="fa fa-users"></i> <span>Clientes</span></a></li>
            <li><a href="index.php?view=spends"><i class="fa fa-tags"></i> <span>Gastos</span></a></li>
            <li><a href="./?view=inventary&stock=<?php echo StockData::getPrincipal()->id;?>"><i class='fa fa-area-chart'></i> <span>Inventario</span></a></li>
            <?php endif; ?>
            <?php if(Core::$user->kind==1):?>
            <li><a href="./index.php?view=home"><i class='fa fa-dashboard'></i> <span>Resumen</span></a></li>
            <li><a href="index.php?view=inventaries"><i class="fa fa-cubes"></i> <span>Inventario Global</span></a></li>
            <li><a href="./index.php?view=sell"><i class='fa fa-shopping-cart'></i> <span>Vender</span></a></li>
            <li><a href="./index.php?view=alerts"><i class='fa fa-bell-o'></i> <span>Alertas</span></a></li>
            <li class="treeview">
              <a href="#"><i class='fa fa-th-list'></i> <span>Catálogos</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="./index.php?view=serie_size"><i class='fa fa-list-ol'></i> <span>Series</span></a></li>
                <li><a href="./index.php?view=details"><i class='fa fa-star-half-o'></i> <span>Marcas/Colores</span></a></li>
                <li><a href="./index.php?view=products"><i class='fa fa-apple'></i> <span>Productos</span></a></li>
                <li><a href="index.php?view=clients"><i class="fa fa-users"></i> <span>Clientes</span></a></li>
                <li><a href="index.php?view=providers"><i class="fa fa-truck"></i> <span>Proveedores</span></a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class='fa fa-money'></i> <span>Finanzas</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="./index.php?view=sells"><i class='fa fa-usd'></i> <span>Ventas</span></a></li>
                <li><a href="index.php?view=box"><i class="fa fa-archive"></i> <span>Caja</span></a></li>
                <li><a href="index.php?view=boxhistory"><i class="fa fa-cut"></i> <span>Cortes/Caja</span></a></li>
                <li><a href="index.php?view=spends"><i class="fa fa-coffee"></i> <span>Gastos</span></a></li>
                <li><a href="index.php?view=balance"><i class="fa fa-usd"></i> <span>Balance</span></a></li>
                <li><a href="index.php?view=gain"><i class="fa fa-usd"></i> <span>Liquidez</span></a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class='fa fa-bar-chart-o'></i> <span>Reportes</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="./index.php?view=analytics"><i class='fa fa-bar-chart-o'></i> <span>Analytics</span></a></li>
              </ul>
            </li>
            <li class="treeview">
              <a href="#"><i class='fa fa-cube'></i> <span>Stock</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=res"><i class="fa fa-refresh"></i> <span>Reabastecimientos</span></a></li>
                <li><a href="./?view=readjustments"><i class="fa fa-adjust"></i> <span>Reajustes</span></a></li>
                <li><a href="./?view=trasps"><i class="fa fa-exchange"></i> <span>Traspasos</span></a></li>
              </ul>
            </li>
            <?php endif; ?>
            <?php if(Core::$user->kind==1):?>
            <li class="treeview">
              <a href="#"><i class='fa fa-cog'></i> <span>Administracion</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="index.php?view=stocks"><i class="fa fa-building"></i> <span>Sucursales</span></a></li>
                <li><a href="./?view=users"><i class="fa fa-users"></i> Usuarios</a></li>
                <li><a href="./?view=settings"><i class="fa fa-cogs"></i> Configuracion</a></li>
              </ul>
            </li>
          <?php endif; ?>
            <?php elseif(isset($_SESSION["client_id"])):?>
          <?php endif;?>
          </ul><!-- /.sidebar-menu -->
        </section><!-- /.sidebar -->
      </aside>
    <?php endif;?>

      <!-- Content Wrapper. Contains page content -->
      <?php if(isset($_SESSION["user_id"]) || isset($_SESSION["client_id"])):?>
      <div class="content-wrapper">
        <?php View::load("index");?>
      </div><!-- /.content-wrapper -->

        <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 7.2
        </div>
        <strong>Copyright &copy; <?php echo date('Y'); ?> <a href="http://sergestec.com/" target="_blank">SERGESTEC</a></strong>
      </footer>
      <?php else:?>
        <?php if(isset($_GET["view"]) && $_GET["view"]=="clientaccess"):?>
    <div class="login-box">
      <div class="login-logo">
        <a href="./"><b>PV MULTISUCURSAL</b></a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
      <center><h4>Cliente</h4></center>
        <form action="./?action=processloginclient" method="post">
          <div class="form-group has-feedback">
            <input type="text" name="username" required class="form-control" placeholder="Usuario"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="password" required class="form-control" placeholder="Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">

            <div class="col-xs-12">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Acceder</button>
              <a href="./" class="btn btn-default btn-block btn-flat"><i class="fa fa-arrow-left"></i> Regresar</a>
            </div><!-- /.col -->
          </div>
        </form>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->  
        <?php else:?>
    <div class="login-box" >
      <div class="login-box-body" >
        <?php $logo = ConfigurationData::getByPreffix("report_image")->val;
          if($logo!=""){
            $url = "storage/configuration/".$logo;
            if(file_exists($url)){
                    echo "<center><img src='$url' width='300px' height='150px'></center>";
                  } }; ?>
        <center><h1>SISTEMA DE ZAPATERÍA</h1></center>
        <form action="./?action=processlogin" method="post">
          <div class="form-group has-feedback">
            <!--<input type="text" name="username" required class="form-control" value="admin" placeholder="Usuario"/>-->
            <select name="username" class="form-control">
                <option value="admin">Administrador</option>
                <option value="vendedor1">Vendedor1</option>
                <option value="vendedor2">Vendedor2</option>
            </select>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="password" required class="form-control" value="admin" placeholder="Contraseña"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">

            <div class="col-xs-12">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Acceder</button>
              <!--
              <a href="./?view=clientaccess" class="btn btn-default btn-block btn-flat">Acceso al cliente <i class="fa fa-arrow-right"></i> </a>-->
            </div><!-- /.col -->
          </div>
        </form>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->  
      <?php endif;?>
      <?php endif;?>


    </div><!-- ./wrapper -->

    <!-- REQUIRED JS SCRIPTS -->

    <!-- jQuery 2.1.4 -->
    <!-- Bootstrap 3.3.2 JS -->
    <script src="plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- AdminLTE App -->
    <script src="plugins/dist/js/app.min.js" type="text/javascript"></script>

    <script src="plugins/datatables/jquery.dataTables.js"></script>
    <script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function(){
        $(".datatable").DataTable({
          "language": {
        "sProcessing":    "Procesando...",
        "sLengthMenu":    "Mostrar _MENU_ registros",
        "sZeroRecords":   "No se encontraron resultados",
        "sEmptyTable":    "Ningún dato disponible en esta tabla",
        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
        "sInfoPostFix":   "",
        "sSearch":        "Buscar:",
        "sUrl":           "",
        "sInfoThousands":  ",",
        "sLoadingRecords": "Cargando...",
        "oPaginate": {
            "sFirst":    "Primero",
            "sLast":    "Último",
            "sNext":    "Siguiente",
            "sPrevious": "Anterior"
        },
        "oAria": {
            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
        }
    }
        });
      });
    </script>
    <!-- Optionally, you can add Slimscroll and FastClick plugins.
          Both of these plugins are recommended to enhance the
          user experience. Slimscroll is required when using the
          fixed layout. -->
  </body>
</html>

