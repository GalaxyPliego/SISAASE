<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 29/06/2022
  Time: 08:32 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html ng-app="sisa" class="ng-scope" lang="es"><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"><style>[ng\:cloak],[ng-cloak],[data-ng-cloak],[x-ng-cloak],.ng-cloak,.x-ng-cloak,.ng-hide:not(.ng-hide-animate){display:none !important;}ng\:form{display:block;}.ng-animate-shim{visibility:hidden;}.ng-anchor{position:absolute;}</style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SISA</title>
    <link rel="icon" href="https://srvcldutez.utez.edu.mx:8443/SISAVA/img/utez/favicon.ico">
    <!-- Bootstrap Core CSS -->
    <link href="SISAASE_files/bootstrap_1.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="SISAASE_files/metisMenu.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="SISAASE_files/general.css" rel="stylesheet">
    <link href="SISAASE_files/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="SISAASE_files/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="SISAASE_files/morris.css" rel="stylesheet">


    <style>
        .pagination {
            display: inline-block;

        }

        .pagination a {
            color: black;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
        }
    </style>

    <!-- Custom Fonts -->
    <!--<link href="SISA_files/font-awesome.css" rel="stylesheet" type="text/css">-->
    <script src="https://kit.fontawesome.com/88d4c41d0b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="SISA_files/sweetalert.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        /* Paste this css to your style sheet file or under head tag */
        /* This only works with JavaScript,
        if it's not present, don't show loader */
        .no-js #loader { display: none;  }
        .js #loader { display: block; position: absolute; left: 100px; top: 0; }
        .se-pre-con {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            /*background: url(/SISAVA/img/system/preloader.gif) center no-repeat #fff;*/
        }
    </style>
</head>

<body ng-controller="controller" ng-init="consultarHistorialPagos()" class="ng-scope">
<div class="se-pre-con text-center" style="display: none;"></div>
<div id="wrapper">
    <div id="page-wrapper" style="min-height: 602px;">






        <!-- Navigation -->
        <nav id="topMenu" class="navbar navbar-default navbar-static-top navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="https://srvcldutez.utez.edu.mx:8443/SISAVA/iniciarSesion" style="color: #FFF !important;">Sistema Integral de Servicios Académicos | SISA</a>
            </div>
            <!-- /.navbar-header -->

            <ul id="rightMenu" class="nav navbar-top-links navbar-right">

                <li class="dropdown">

                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" id="cerrarSesion" href="https://srvcldutez.utez.edu.mx:8443/SISAVA/cerrarSesion">
                        <i class="fa fa-power-off fa-fw"></i>  Salir
                    </a>
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->






            <div id="leftMenu" class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search text-center hidden-xs " style="background-color: #fff;padding: 15px 0 5px 0;">
                            <img src="SISA_files/lenguaje-incluyente.png" width="100%">
                        </li>
                        <li class="sidebar-search text-center" style="color: #fff;">
                            <h5>Nathaly Escalona Ruiz</h5>
                            <h4>Estudiante</h4>
                        </li>
                        <li>
                            <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/seguimiento/historialAcademico/historialAcademico.jsp"><i class="fa fa-book fa-fw"></i> Historial académico</a>
                        </li>
                        <li>
                            <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-file-text"></i> Evaluación docente</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-arrow-down fa-fw"></i> Bajas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/baja/solicitudBaja/bajasRegistroSolicitud.jsp">Registrar solicitud</a>
                                </li>
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/baja/historialBajas/historialBajas.jsp">Historial de  bajas</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-usd fa-fw"></i> Pagos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse in">
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/seguimiento/pagos/pagosFicha.jsp">Fichas de pago</a>
                                </li>
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/seguimiento/pagos/pagosHistorial.jsp" class="active">Solicitud de asesorías académicas</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Estadías<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level collapse">
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/estadia/cartaPresentacion/cartaPresentacion.jsp">Carta Presentación</a>
                                </li>
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/estadia/convenioIndividual/convenionIndividual.jsp">Asignación y aceptación de estadía</a>
                                </li>
                                <li>
                                    <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/estadia/resumenEstadia/resumenEstadia.jsp">Resumen estadía</a>
                                </li>
                            </ul>
                        </li>
                        <!--            <li>
                                        <a href="/SISAVA/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-braille fa-fw"></i> Evaluación Docente</a>
                                    </li>-->
                        <li>
                            <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/jsp/permanencia/perfil/alumno/perfilAlumno.jsp"><i class="fa fa-user-o fa-fw"></i>Mi Perfil</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
























        </nav>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header" style="background: #345177; color: white;">
                        <h4 class="modal-title" id="myModalLabel">Roles</h4>
                    </div>
                    <div class="modal-body">
                        <h4>Selecciona el rol para acceder a las funcionalidades correspondientes.</h4>
                        <div class="row">

                            <div class="col-md-12">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <a href="https://srvcldutez.utez.edu.mx:8443/SISAVA/cambiarSesion?idRolCambiar=Alumno&amp;rolCambiar=Estudiante" style="color: white;">
                                                <div class="col-md-8">Estudiante</div>
                                                <div class="col-md-4 text-right"><span class="text-right"><i class="fa fa-angle-right"></i></span></div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <p>Estudiante.</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="wrapper"></div>

        <br>
        <div class="panel panel-primary">
            <div class="panel-heading">Asesorías pendientes</div>
            <div class="panel-body">
                <div ng-show="!historial" class="text-center ng-hide">
                    <img src="SISA_files/preloader.gif">
                </div>
                <div ng-show="historial" class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <td>#</td>
                                    <td>Fecha</td>
                                    <td>Hora</td>
                                    <td>Nombre</td>
                                    <td>Tema</td>
                                    <td>Estado</td>
                                    <td>Acciones</td>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->
                                <tr>
                                    <td></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr ng-repeat="pago in historial.lista" class="ng-scope">

                                    <td class="ng-binding">1</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#F0AD4E ;">Pendiente</td>
                                    <td class="ng-binding"><button class="btn btn-success"><i class="fas fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista --><tr ng-repeat="pago in historial.lista" class="ng-scope">
                                    <td class="ng-binding">2</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#F0AD4E ;">Pendiente</td>
                                    <td class="ng-binding"><button class="btn btn-success"><i class="fas fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista --><tr ng-repeat="pago in historial.lista" class="ng-scope">
                                    <td class="ng-binding">3</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#F0AD4E ;">Pendiente</td>
                                    <td class="ng-binding"><button class="btn btn-success"><i class="fas fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->

                                </tbody></table>
                        </div>
                        <center>
                            <div class="pagination">
                                <a href="#">&laquo;</a>
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">6</a>
                                <a href="#">&raquo;</a>
                            </div>
                        </center>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">Asesorías aceptadas</div>
                </div>
                <div ng-show="historial" class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <td>#</td>
                                    <td>Fecha</td>
                                    <td>Hora</td>
                                    <td>Nombre</td>
                                    <td>Tema</td>
                                    <td>Estado</td>
                                    <td>Acciones</td>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->
                                <tr>
                                    <td></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td><input type="text" placeholder="Buscar"/></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr ng-repeat="pago in historial.lista" class="ng-scope">

                                    <td class="ng-binding">1</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#069779 ;">Aceptada</td>
                                    <td class="ng-binding"><button class="btn btn-success" style="margin-right:5px ;"><i class="fas fa-search"></i></button><button class="btn btn-danger"><i class="fas fa-calendar-times"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista --><tr ng-repeat="pago in historial.lista" class="ng-scope">
                                    <td class="ng-binding">2</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#069779 ;">Aceptada</td>
                                    <td class="ng-binding"><button class="btn btn-success" style="margin-right:5px ;"><i class="fas fa-search"></i></button><button class="btn btn-danger"><i class="fas fa-calendar-times"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista --><tr ng-repeat="pago in historial.lista" class="ng-scope">
                                    <td class="ng-binding">3</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#069779 ;">Aceptada</td>
                                    <td class="ng-binding"><button class="btn btn-success" style="margin-right:5px ;"><i class="fas fa-search"></i></button><button class="btn btn-danger"><i class="fas fa-calendar-times"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->

                                </tbody></table>
                        </div>
                        <center>
                            <div class="pagination">
                                <a href="#">&laquo;</a>
                                <a href="#">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">6</a>
                                <a href="#">&raquo;</a>
                            </div>
                        </center>
                    </div>
                </div>
            </div>
        </div>




    </div>
</div>
</div>



<!-- /#wrapper -->
<!-- jQuery -->
<script src="SISA_files/jquery.js"></script>
<script>
    //paste this code under the head tag or in a separate js file.
    // Wait for window load
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
        ;
    });
</script>
<!-- Angular -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>-->
<script src="SISA_files/angular-1.js"></script>
<script src="SISA_files/ajsPagosHistorial.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="SISA_files/bootstrap.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="SISA_files/metisMenu.js"></script>
<!--         Morris Charts JavaScript
        <script src="/SISAVA/components/raphael/raphael-min.js"></script>
        <script src="/SISAVA/components/morrisjs/morris.min.js"></script>
        <script src="/SISAVA/js/morris-data.js"></script>-->
<!-- Custom Theme JavaScript -->
<script src="SISA_files/sb-admin-2.js"></script>
<script src="SISA_files/sweetalert.js"></script>
<script src="SISA_files/SweetAlert.js"></script>
<script src="SISA_files/smart-table.js"></script>


</body></html>
