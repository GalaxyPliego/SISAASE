<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String context = request.getContextPath();%>
<!DOCTYPE html>
<html lang="es" id="ng-app" ng-app="sisa">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SISA</title>
    <link rel="icon" href="/SISAASE_war_exploded/img/utez/favicon.ico" />
    <!-- Bootstrap Core CSS -->
    <link href="/SISAASE_war_exploded/components/bootstrap/dist/css/bootstrap_1.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/SISAASE_war_exploded/css/gestionHistorial/stylesGestionHistorial.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/SISAASE_war_exploded/components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="/SISAASE_war_exploded/css/sweetalert.css" />
    <link rel="icon" href="/SISAASE_war_exploded/img/utez/favicon.ico" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        /* Sticky footer styles-------------------------------------------------- */
        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            /* Set the fixed height of the footer here */
            height: 60px;
            /*background-color: #f5f5f5;*/
        }
        @media only screen and (max-width: 600px) {
            .footer {
                position: relative;
                bottom: 0;
                width: 100%;
                height:60px;
            }
        }
        @media only screen and (max-height: 600px) and (max-height: 600px){
            .footer {
                position: relative;
                bottom: 0;
                width: 100%;
                height:60px;
            }
        }
        /* Custom page CSS-------------------------------------------------- */
        /* Not required for template or sticky footer method. */
        .container .text-muted {
            margin: 20px 0;
        }
    </style>
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
            background: url(/SISAASE_war_exploded/img/system/preloader.gif) center no-repeat #fff;
        }
    </style>
</head>
<body ng-controller="controller" ng-init="consultarHistorialPagos()">
<div class="se-pre-con text-center"></div>
<div id="wrapper">
    <div id="page-wrapper">






        <!-- Navigation -->
        <nav id="topMenu" class="navbar navbar-default navbar-static-top navbar-fixed-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/SISAVA/iniciarSesion" style="color: #FFF !important;" >Sistema Integral de Servicios Académicos | SISA</a>
            </div>
            <!-- /.navbar-header -->

            <ul id="rightMenu" class="nav navbar-top-links navbar-right">

                <li class="dropdown">

                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" id="cerrarSesion" href="/SISAVA/cerrarSesion">
                        <i class="fa fa-power-off fa-fw"></i>  Salir
                    </a>
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->





            <!DOCTYPE html>
            <div id="leftMenu" class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search text-center hidden-xs " style="background-color: #fff;padding: 15px 0 5px 0;">
                            <img width="100%" src="/SISAVA/img/utez/lenguaje-incluyente.png" />
                        </li>
                        <li class="sidebar-search text-center" style="color: #fff;">
                            <h5>Carlos Ricardo Espinoza Pliego</h5>
                            <h4>Estudiante</h4>
                        </li>
                        <li>
                            <a href="/SISAVA/jsp/permanencia/seguimiento/historialAcademico/historialAcademico.jsp"><i class="fa fa-book fa-fw"></i> Historial académico</a>
                        </li>
                        <li>
                            <a href="/SISAVA/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-file-text"></i> Evaluación docente</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-arrow-down fa-fw"></i> Bajas<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/baja/solicitudBaja/bajasRegistroSolicitud.jsp">Registrar solicitud</a>
                                </li>
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/baja/historialBajas/historialBajas.jsp">Historial de  bajas</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-usd fa-fw"></i> Pagos<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/seguimiento/pagos/pagosFicha.jsp">Fichas de pago</a>
                                </li>
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/seguimiento/pagos/pagosHistorial.jsp">Historial de pagos</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Estadías<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/estadia/cartaPresentacion/cartaPresentacion.jsp">Carta Presentación</a>
                                </li>
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/estadia/convenioIndividual/convenionIndividual.jsp">Asignación y aceptación de estadía</a>
                                </li>
                                <li>
                                    <a href="/SISAVA/jsp/permanencia/estadia/resumenEstadia/resumenEstadia.jsp">Resumen estadía</a>
                                </li>
                            </ul>
                        </li>
                        <!--            <li>
                                        <a href="/SISAVA/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-braille fa-fw"></i> Evaluación Docente</a>
                                    </li>-->
                        <li>
                            <a href="/SISAVA/jsp/permanencia/perfil/alumno/perfilAlumno.jsp"><i class="fa fa-user-o fa-fw"></i>Mi Perfil</a>
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
                                            <a href="/SISAVA/cambiarSesion?idRolCambiar=Alumno&rolCambiar=Estudiante" style="color: white;">
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

        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">Historial de pagos</div>
            <div class="panel-body">
                <div ng-show="!historial" class="text-center">
                    <img src="/SISAVA/img/system/preloader.gif"/>
                </div>
                <div ng-show="historial" class="row">
                    <div class="col-md-12" >
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <td>#</td>
                                    <td>Concepto del pago</td>
                                    <td>Costo</td>
                                    <td>Pagado</td>
                                    <td>Fecha pago</td>
                                    <td>Tipo</td>
                                </tr>
                                </thead>
                                <tr ng-repeat="pago in historial.lista">
                                    <td ng-cloak>{{$index + 1}}</td>
                                    <td ng-cloak>{{pago.id > 11 ? pago.descripcion :pago.id > 1 && pago.id < 7 ? 'Colegiatura '+pago.id+"°"+pago.descripcion.split("°")[1].replace("TSU","") : pago.id > 7 && pago.id <= 11 ? 'Colegiatura '+pago.id+"°"+pago.descripcion.split("°")[1].replace("ING","") : 'Inscripción y colegiatura'}}</td>
                                    <td ng-cloak>$ {{pago.totalPago}}</td>
                                    <td ng-cloak>$ {{pago.pago}}</td>
                                    <td ng-cloak>{{pago.registroFecha}}</td>
                                    <td ng-cloak>{{pago.tipo}}</td>
                                </tr>

                            </table>
                        </div>
                    </div>
                </div>
                <div ng-show="historial" class="row">
                    <div class="col-md-12 text-center" >
                        <div class="form-group">
                            <button type="submit" ng-click="generarReporteHistorialPagos()" class="btn btn-danger">Exportar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<script src="/SISAVA/components/jquery/dist/jquery.min.js"></script>
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
<script src="/SISAVA/js/angular-1.4.6.min.js"></script>
<script src="/SISAVA/js/control/permanencia/seguimiento/pagos/ajsPagosHistorial.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/SISAVA/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/SISAVA/components/metisMenu/dist/metisMenu.min.js"></script>
<!--         Morris Charts JavaScript
        <script src="/SISAVA/components/raphael/raphael-min.js"></script>
        <script src="/SISAVA/components/morrisjs/morris.min.js"></script>
        <script src="/SISAVA/js/morris-data.js"></script>-->
<!-- Custom Theme JavaScript -->
<script src="/SISAVA/js/sb-admin-2.js"></script>
<script src="/SISAVA/js/sweetalert.min_1.js"></script>
<script src="/SISAVA/js/SweetAlert.min.js"></script>
<script src="/SISAVA/js/smart-table.min.js"></script>
</body>
</html>
