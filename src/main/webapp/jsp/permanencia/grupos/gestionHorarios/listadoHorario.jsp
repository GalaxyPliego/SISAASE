<%--
  Created by IntelliJ IDEA.
  User: CDS-UTEZ
  Date: 30/06/2022
  Time: 12:30 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es" ng-app="sisa">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SISA</title>
    <link rel="icon" href="/SISAASE_war_exploded/img/utez/favicon.ico"/>
    <!-- Bootstrap Core CSS -->
    <link href="/SISAASE_war_exploded/components/bootstrap/dist/css/bootstrap_1.css" rel="stylesheet">


    <!-- MetisMenu CSS -->
    <link href="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="/SISAASE_war_exploded/css/general.css" rel="stylesheet">
    <link href="/SISAASE_war_exploded/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/SISAASE_war_exploded/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/SISAASE_war_exploded/components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/SISAASE_war_exploded/components/font-awesome/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

    <!-- include the core styles -->
    <link rel="stylesheet" href="/SISAASE_war_exploded/css/alertify.core.css"/>
    <!-- include a theme, can be included into the core instead of 2 separate files -->
    <link rel="stylesheet" href="/SISAASE_war_exploded/css/sweetalert.css"/>


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>

        body {
            font-family: 'Open Sans', sans-serif;
        }

        .fb-profile img.fb-image-lg {
            z-index: 0;
            width: 100%;
            margin-bottom: 10px;
        }

        .fb-image-profile {
            margin: -90px 10px 0px 50px;
            z-index: 9;
            width: 13%;
        }

        @media (max-width: 768px) {

            .fb-profile-text > h1 {
                font-size: 14px;
            }

            .fb-image-profile {
                margin: -45px 10px 0px 25px;
                z-index: 9;
                width: 13%;
            }
        }
    </style>
    <style>
        /* Paste this css to your style sheet file or under head tag */
        /* This only works with JavaScript,
        if it's not present, don't show loader */
        .no-js #loader {
            display: none;
        }

        .js #loader {
            display: block;
            position: absolute;
            left: 100px;
            top: 0;
        }

        .se-pre-con {
            position: fixed;
            left: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background: url(/img/system/preloader.gif) center no-repeat #fff;
        }
    </style>
</head>

<body ng-controller="controller" ng-init="consultarHistorialPagos()">
<div class="se-pre-con text-center"></div>
<div id="wrapper">
    <div id="page-wrapper">


        <!-- Navigation -->
        <nav id="topMenu" class="navbar navbar-default navbar-static-top navbar-fixed-top" role="navigation"
             style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/SISAVA/iniciarSesion" style="color: #FFF !important;">Sistema Integral de
                    Servicios Académicos | SISA</a>
            </div>
            <!-- /.navbar-header -->

            <ul id="rightMenu" class="nav navbar-top-links navbar-right">

                <li class="dropdown">

                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" id="cerrarSesion" href="/SISAVA/cerrarSesion">
                        <i class="fa fa-power-off fa-fw"></i> Salir
                    </a>
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->


            <!DOCTYPE html>
            <div id="leftMenu" class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search text-center hidden-xs "
                            style="background-color: #fff;padding: 15px 0 5px 0;">
                            <img width="100%" src="/SISAASE_war_exploded/img/utez/lenguaje-incluyente.png"/>
                        </li>
                        <li class="sidebar-search text-center" style="color: #fff;">
                            <h5>Tania Belen Galindo Villegas</h5>
                            <h4>Estudiante</h4>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/gestionHorarios/asignarMaterias.jsp"><i class="fa fa-book fa-fw"></i> Materias </a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/gestionHorarios/listadoHorario.jsp"><i class="fa fa-clock-o"></i> Horarios </a>
                        </li>
                        <!--            <li>
                                        <a href="/SISAVA/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-braille fa-fw"></i> Evaluación Docente</a>
                                    </li>-->
                        <li>
                            <a href=""><i class="fa fa-user-o fa-fw"></i>Mi Perfil</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->


        </nav>
<%--        <div class="modal fade" id="myModal" role="dialog">--%>
<%--            <div class="modal-dialog">--%>

<%--                <!-- Modal content-->--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header" style="background: #345177; color: white;">--%>
<%--                        <h4 class="modal-title" id="myModalLabel">Roles</h4>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <h4>Selecciona el rol para acceder a las funcionalidades correspondientes.</h4>--%>
<%--                        <div class="row">--%>

<%--                            <div class="col-md-12">--%>
<%--                                <div class="panel panel-primary">--%>
<%--                                    <div class="panel-heading">--%>
<%--                                        <div class="row">--%>
<%--                                            <a href="/SISAVA/cambiarSesion?idRolCambiar=Alumno&rolCambiar=Estudiante"--%>
<%--                                               style="color: white;">--%>
<%--                                                <div class="col-md-8">Estudiante</div>--%>
<%--                                                <div class="col-md-4 text-right"><span class="text-right"><i--%>
<%--                                                        class="fa fa-angle-right"></i></span></div>--%>
<%--                                            </a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="panel-body">--%>
<%--                                        <p>Estudiante.</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="modal-footer">--%>
<%--                        <button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">--%>
<%--                            Cerrar--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">Horarios</div>
            <div class="panel-body">
                <div ng-show="!historial" class="text-center">
                    <%--                    <img src="/SISAASE_war_exploded/img/system/preloader.gif"/>--%>
                    <div class="alert alert-warning alert-dismissible" role="alert">
                        <strong>Se sugiere brindar asesoría dos días por semana en un solo horario por día</strong>
                    </div>
                </div>
                <div ng-show="historial" class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <td>#</td>
                                    <td>Días disponibles</td>
                                    <td>Horario</td>
                                    <td>Acciones</td>
                                </tr>
                                </thead>
                                <tr ng-repeat="pago in historial.lista">
                                    <th><input type="checkbox"></th>
                                    <td>Lunes</td>
                                    <td>
                                        <form class="form-inline">
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label>-</label>
                                                <input type="text" class="form-control">
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <span class="fa fa-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="fa fa-times"></span>
                                        </button>
                                    </td>
                                </tr>

                                <tr ng-repeat="pago in historial.lista">
                                    <th><input type="checkbox"></th>
                                    <td>Martes</td>
                                    <td>
                                        <label>No hay asesoría</label>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <span class="fa fa-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="fa fa-times"></span>
                                        </button>
                                    </td>
                                </tr>

                                <tr ng-repeat="pago in historial.lista">
                                    <th><input type="checkbox"></th>
                                    <td>Miercoles</td>
                                    <td>
                                        <form class="form-inline">
                                            <div class="form-group">
                                                <input type="text" class="form-control">
                                            </div>
                                            <div class="form-group">
                                                <label>-</label>
                                                <input type="text" class="form-control">
                                            </div>
                                        </form>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <span class="fa fa-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="fa fa-times"></span>
                                        </button>
                                    </td>
                                </tr>

                                <tr ng-repeat="pago in historial.lista">
                                    <th><input type="checkbox"></th>
                                    <td>Jueves</td>
                                    <td>
                                        <label>No hay asesoría</label>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <span class="fa fa-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="fa fa-times"></span>
                                        </button>
                                    </td>
                                </tr>

                                <tr ng-repeat="pago in historial.lista">
                                    <th><input type="checkbox"></th>
                                    <td>Viernes</td>
                                    <td>
                                        <label>No hay asesoría</label>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <span class="fa fa-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="fa fa-times"></span>
                                        </button>
                                    </td>
                                </tr>

                                <tr ng-repeat="pago in historial.lista">
                                    <th><input type="checkbox"></th>
                                    <td>Sábado</td>
                                    <td>
                                        <label>No hay asesoría</label>
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-success">
                                            <span class="fa fa-plus"></span>
                                        </button>
                                        <button type="button" class="btn btn-primary">
                                            <span class="fa fa-pencil"></span>
                                        </button>
                                        <button type="button" class="btn btn-danger">
                                            <span class="fa fa-times"></span>
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div ng-show="historial" class="row">
                    <div class="col-md-12 text-center">
                        <div class="form-group">
                            <button type="submit" ng-click="generarReporteHistorialPagos()" class="btn btn-success">
                                Guardar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#wrapper -->
<!-- jQuery -->
<script src="/SISAASE_war_exploded/components/jquery/dist/jquery.min.js"></script>
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
<script src="/SISAASE_war_exploded/js/angular-1.4.6.min.js"></script>
<script src=""></script>
<!-- Bootstrap Core JavaScript -->
<script src="/SISAASE_war_exploded/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.js"></script>
<%--Morris Charts JavaScript--%>
<script src="/SISAASE_war_exploded/components/raphael/raphael-min.js"></script>
<script src="/SISAASE_war_exploded/components/morrisjs/morris.min.js"></script>
<script src="/SISAASE_war_exploded/js/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/SISAASE_war_exploded/js/sb-admin-2.js"></script>
<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/smart-table.min.js"></script>
</body>
</html>
