<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String context = request.getContextPath();%>

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
            .iconsCards{
                font-size: 90px;
            }
        }
        @media (min-width:768px){
            .iconsCards{
                font-size: 150px;
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

<body ng-controller="resumenHistorial" ng-init="consultarPerfil()">
    <div class="se-pre-con text-center"></div>
    <div id="wrapper">
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

            <!-- sideBar-->
            <div id="leftMenu" class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search text-center hidden-xs " style="background-color: #fff;padding: 15px 0 5px 0;">
                            <img width="100%" src="/SISAASE_war_exploded/img/utez/lenguaje-incluyente.png" />
                        </li>
                        <li class="sidebar-search text-center" style="color: #fff;">
                            <h5>${sessionScope.datosPersonales.nombres} ${sessionScope.datosPersonales.aPaterno} ${sessionScope.datosPersonales.aMaterno}</h5>
                            <h4>Coordinador</h4>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/coordinador"><i class="fa fa-book fa-fw"></i>Resumen</a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/historialDetallado"><i class="fa fa-file-text"></i> Historial Detallado</a>
                        </li>
                        <li>
                            <a href="/SISAASE_war_exploded/historialGeneral"><i class="fa fa-file-text"></i> Historial General</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->


        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <br/>

            <!-- Panel principal -->
            <div class="panel panel-primary">
                <!-- Panel heading -->
                <div class="panel-heading">Resumen de Asesorías</div>
                <!-- Panel body -->
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <!-- filtrado con un select por periodo cuatrimestral -->
                            <div class="form-group" ng-init="findPeriodoCuatrimestral()">
                                <label for="periodoCuatrimestral">Periodo Cuatrimestral:</label>
                                <select class="form-control" id="periodoCuatrimestral" ng-model="periodoCuatrimestral" ng-options="periodoCuatrimestral.nombreCuatrimestre for periodoCuatrimestral in arrayPeriodoCuatrimestral track by periodoCuatrimestral.idPeriodoCuatrimestral" ng-change="cambioPeriodo()">
                                    <option value="">Seleccione un periodo</option>
                                    <option value="" ></option>
                                    <!--<option ng-repeat="periodo in periodos" value="{{periodo.id}}">{{periodo.periodo}}</option>-->
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-6 col-xs-12">
                            <div class="panel panel-green">
                                <div class="panel-body bg-danger "  style="background-color: #009574; padding: 25px;">
                                    <div class="row" style="display: flex;">

                                        <div class="col-lg-6 col-md-6 col-sm-12" style="display: flex; justify-content: center; align-items: center">
                                            <i class="fa fa-calendar-check-o fa-5x iconsCards " style="color: white;" aria-hidden="true"></i>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="row">
                                                <h2 style="color: white; letter-spacing: 5px;"><strong>Sesiones</strong></h2>
                                            </div>
                                            <div class="row ">
                                                <p style="color: white; font-size: 20px;">Hombres: <strong>30</strong></p>
                                                <p style="color: white; font-size: 20px;">Mujeres: <strong>56</strong></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer text-center">
                                    <h2 class="titlesCards" style="color: #009574; margin: 0px; padding: 0;">Total: <strong>86</strong></h2>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-xs-12">
                            <div class="panel panel-green">
                                <div class="panel-body bg-danger "  style="background-color: #009574; padding: 25px;">
                                    <div class="row" style="display: flex;">

                                        <div class="col-lg-6 col-md-6 col-sm-12 mar" style="display: flex; justify-content: center; align-items: center">
                                            <i class="fa fa-calendar-check-o fa-5x iconsCards" style="color: white; " aria-hidden="true"></i>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12">
                                            <div class="row">
                                                <h2 class="titlesCards" style="color: white;"><strong>Atendidos</strong></h2>
                                            </div>
                                            <div class="row ">
                                                <p style="color: white; font-size: 20px;">Hombres: <strong>23</strong></p>
                                                <p style="color: white; font-size: 20px;">Mujeres: <strong>35</strong></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-footer text-center">
                                    <h2 style="color: #009574; margin: 0px; padding: 0;">Total: <strong>58</strong></h2>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="panel panel-green">
                                <div class="panel-body" style="background-color: #009574; padding-left: 25px; padding-top: 25px">
                                    <div class="row" style="">
                                        <div class="col-lg-4 col-md-12 col-sm-12" style="display: flex; justify-content: center; align-items: center; margin-bottom: 10px;">
                                            <i class="fa fa-calendar-check-o fa-5x iconsCardsSecondary " style="color: white;" aria-hidden="true"></i>
                                        </div>

                                        <div class="col-lg-6 col-lg-offset-1 col-md-12 col-sm-12" style="margin-top: -20px">
                                            <div class="row">
                                                <h3 class="titleLargeCards" style="color: white; letter-spacing: 1px;"><strong>Aceptadas</strong></h3>
                                            </div>
                                            <div class="row ">
                                                <p style="color: white; font-size: 16px;">Hombres: <strong>16</strong></p>
                                                <p style="color: white; font-size: 16px;">Mujeres: <strong>25</strong></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer text-center">
                                    <h3 class="titlesCards" style="color: #009574; margin: 0px; padding: 0;">Total: <strong>41</strong></h3>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 col-xs-6">
                            <div class="panel" style="border: 1px solid #F0AD4E">
                                <div class="panel-body" style="background-color: #F0AD4E; padding-left: 25px; padding-top: 25px">
                                    <div class="row" style="">
                                        <div class="col-lg-4 col-md-12 col-sm-12" style="display: flex; justify-content: center; align-items: center; margin-bottom: 10px;">
                                            <i class="fa fa-calendar-minus-o fa-5x iconsCardsSecondary" style="color: white;" aria-hidden="true"></i>
                                        </div>

                                        <div class="col-lg-6 col-lg-offset-1 col-md-12 col-sm-12" style="margin-top: -20px">
                                            <div class="row">
                                                <h3 style="color: white; letter-spacing: 1px;"><strong>Pendientes</strong></h3>
                                            </div>
                                            <div class="row ">
                                                <p style="color: white; font-size: 16px;">Hombres: <strong>5</strong></p>
                                                <p style="color: white; font-size: 16px;">Mujeres: <strong>2</strong></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer text-center">
                                    <h3 class="titlesCards" style="color: #F0AD4E; margin: 0px; padding: 0;">Total: <strong>7</strong></h3>
                                </div>

                            </div>
                        </div>
                        <div class="col-md-3 col-xs-6">
                            <div class="panel" style="border: 1px solid #E74C3C">
                                <div class="panel-body" style="background-color: #E74C3C; padding-left: 25px; padding-top: 25px">
                                    <div class="row" style="">
                                        <div class="col-lg-4 col-md-12 col-sm-12" style="display: flex; justify-content: center; align-items: center; margin-bottom: 10px;">
                                            <i class="fa fa-calendar-times-o fa-5x iconsCardsSecondary" style="color: white;" aria-hidden="true"></i>
                                        </div>

                                        <div class="col-lg-6 col-lg-offset-1 col-md-12 col-sm-12" style="margin-top: -20px">
                                            <div class="row">
                                                <h3 class="titleLargeCards" style="color: white;"><strong>Rechazadas</strong></h3>
                                            </div>
                                            <div class="row ">
                                                <p style="color: white; font-size: 16px;">Hombres: <strong>22</strong></p>
                                                <p style="color: white; font-size: 16px;">Mujeres: <strong>14</strong></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer text-center">
                                    <h3 class="titlesCards" style="color: #E74C3C; margin: 0px; padding: 0;">Total: <strong>36</strong></h3>
                                </div>

                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="panel" style="border: 1px solid #E74C3C">
                                <div class="panel-body" style="background-color: #E74C3C; padding-left: 25px; padding-top: 25px">
                                    <div class="row" style="">
                                        <div class="col-lg-4 col-md-12 col-sm-12" style="display: flex; justify-content: center; align-items: center; margin-bottom: 10px;">
                                            <i class="fa fa-calendar-times-o fa-5x iconsCardsSecondary" style="color: white;" aria-hidden="true"></i>
                                        </div>

                                        <div class="col-lg-6 col-lg-offset-1 col-md-12 col-sm-12" style="margin-top: -20px">
                                            <div class="row">
                                                <h3 class="titleLargeCards" style="color: white; "><strong>Canceladas</strong></h3>
                                            </div>
                                            <div class="row ">
                                                <p style="color: white; font-size: 16px;">Hombres: <strong>30</strong></p>
                                                <p style="color: white; font-size: 16px;">Mujeres: <strong>50</strong></p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="panel-footer text-center">
                                    <h3 class="titlesCards" style="color: #E74C3C; margin: 0px; padding: 0;">Total: <strong>80</strong></h3>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <!-- /#page-wrapper -->
    </div>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>-->
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
    <!--<script src="/SISAASE_war_exploded/js/configuracion.js"></script>-->

    <!-- Bootstrap Core JavaScript -->
    <script src="/SISAASE_war_exploded/components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/SISAASE_war_exploded/js/sb-admin-2.js"></script>

    <!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.6/angular.min.js"></script>-->

    <script src="/SISAASE_war_exploded/js/angular-1.4.6.min.js"></script>


    <!--Script Angular Perfil-->
    <script src="/SISAASE_war_exploded/js/control/permanencia/grupos/gestionHistorial/gestionHistorial.js"></script>


    <script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
    <script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
    <script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>
    <script src="/SISAASE_war_exploded/js/ui-bootstrap-tpls-0.14.3.js"></script>
    <script src="/SISAASE_war_exploded/js/smart-table.min.js"></script>


</body>

</html>