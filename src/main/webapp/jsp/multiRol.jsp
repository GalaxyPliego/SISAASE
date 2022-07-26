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
    <link rel="icon" href="/SISAASE_war_exploded/img/utez/favicon.ico" />
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
    <link href="/SISAASE_war_exploded/components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- include the core styles -->
    <link rel="stylesheet" href="/SISAASE_war_exploded/css/alertify.core.css" />
    <!-- include a theme, can be included into the core instead of 2 separate files -->
    <link rel="stylesheet" href="/SISAASE_war_exploded/css/sweetalert.css" />


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>

        body
        {
            font-family: 'Open Sans', sans-serif;
        }

        .fb-profile img.fb-image-lg{
            z-index: 0;
            width: 100%;
            margin-bottom: 10px;
        }

        .fb-image-profile
        {
            margin: -90px 10px 0px 50px;
            z-index: 9;
            width: 13%;
        }

        @media (max-width:768px)
        {

            .fb-profile-text>h1{
                font-size:14px;
            }

            .fb-image-profile
            {
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

<body ng-controller="ControlRol" ng-init="mostrarMultiRol()">
<div class="se-pre-con text-center"></div>







<!-- Navigation -->
<nav id="topMenu" class="navbar navbar-default navbar-static-top navbar-fixed-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Navegación</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/SISAASE_war_exploded/iniciarSesion" style="color: #FFF !important;" >Sistema Integral de Servicios Académicos | SISA</a>
    </div>
    <!-- /.navbar-header -->

    <ul id="rightMenu" class="nav navbar-top-links navbar-right">

        <li class="dropdown">

        </li>
        <li class="dropdown">
            <a class="dropdown-toggle" id="cerrarSesion" href="/SISAASE_war_exploded/cerrarSesion">
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
                    <img width="100%" src="/SISAASE_war_exploded/img/utez/lenguaje-incluyente.png" />
                </li>
                <li class="sidebar-search text-center" style="color: #fff;">
                    <h5>Roy Axxel Salgado Mart&iacute;nez</h5>
                    <h4>Estudiante</h4>
                </li>
                <li>
                    <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/historialAcademico/historialAcademico.jsp"><i class="fa fa-book fa-fw"></i> Historial académico</a>
                </li>
                <li>
                    <a href="/SISAASE_war_exploded/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-file-text"></i> Evaluación docente</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-arrow-down fa-fw"></i> Bajas<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/baja/solicitudBaja/bajasRegistroSolicitud.jsp">Registrar solicitud</a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/baja/historialBajas/historialBajas.jsp">Historial de  bajas</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-usd fa-fw"></i> Pagos<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/pagos/pagosFicha.jsp">Fichas de pago</a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/pagos/pagosHistorial.jsp">Historial de pagos</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Estadías<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/cartaPresentacion/cartaPresentacion.jsp">Carta Presentación</a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/convenioIndividual/convenionIndividual.jsp">Asignación y aceptación de estadía</a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/resumenEstadia/resumenEstadia.jsp">Resumen estadía</a>
                        </li>
                    </ul>
                </li>
                <!--            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-braille fa-fw"></i> Evaluación Docente</a>
                            </li>-->
                <li>
                    <a href="/SISAASE_war_exploded/jsp/permanencia/perfil/alumno/perfilAlumno.jsp"><i class="fa fa-user-o fa-fw"></i>Mi Perfil</a>
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
                                    <a href="/SISAASE_war_exploded/cambiarSesion?idRolCambiar=Alumno&rolCambiar=Estudiante" style="color: white;">
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


<div class="modal fade in" role="dialog" id="modalMultiRol" tabindex="-1"  style="display: block;">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background: #345177; color: white;">
                <h4 class="modal-title" id="myModalLabel">Roles</h4>
            </div>
            <div class="modal-body">
                <h4>Selecciona el rol con el que deseas iniciar sesión.</h4>
                <div class="row">

                    <div class="col-md-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <div class="row">
                                    <a href="/SISAASE_war_exploded/cambiarSesion?idRolCambiar=Alumno&rolCambiar=Estudiante" style="color: white;">
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
        </div>
    </div>
</div>
<script src="/SISAASE_war_exploded/components/jquery/dist/jquery.min.js"></script>
<script>
    $(window).load(function () {
        $(".se-pre-con").fadeOut("slow");
        $('span').tooltip();
    });
</script>

<!-- Bootstrap Core JavaScript -->
<script src="/SISAASE_war_exploded/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/SISAASE_war_exploded/js/sb-admin-2.js"></script>

<script src="/SISAASE_war_exploded/js/angular-1.4.6.min.js"></script>
<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>
<script src="/SISAASE_war_exploded/js/ui-bootstrap-tpls-0.14.3.js"></script>

<!--Script Angular Perfil-->
<script src="/SISAASE_war_exploded/js/control/permanencia/perfil/ajsControlRol.js"></script>
</body>
</html>

