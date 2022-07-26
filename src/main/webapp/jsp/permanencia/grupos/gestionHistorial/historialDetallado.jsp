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

<body ng-controller="historialDetallado" ng-init="">
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
                        <h5>Jazmin Isabel Rogel Arizmendi</h5>
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
            <div class="panel-heading">Historial Detallado de Asesorías</div>
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
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table ng-init="findHistorialDetallado()" st-safe-src="rowCollection" st-table="displayCollection" st-set-filter="myStrictFilter" class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <th>#</th>
                                    <th st-sort="matricula">Matrícula</th>
                                    <th st-sort="nombres">Nombre</th>
                                    <th st-sort="sexo">Sexo</th>
                                    <th st-sort="carrera">Carrera</th>
                                    <th st-sort="cuatrimestre">Cuatrimestre</th>
                                    <th st-sort="grupo">Grupo</th>
                                    <th st-sort="noAsesorias">No. Aseorías</th>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->
                                <tr >
                                    <td></td>
                                    <td><input st-search="matricula" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="nombre" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="sexo" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="carrera" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="grado" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="grupo" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="noAsesorias" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                </tr>
                                <tr ng-repeat="historial in arrayHistorialDetallado | orderBy : 'fecha'" class="ng-scope">

                                    <td ng-bind="$index + 1"> </td>
                                    <td ng-bind="historial.matricula.matricula | uppercase "></td>
                                    <td ng-bind="historial.matricula.nombres"></td>
                                    <td ng-bind="historial.matricula.sexo"></td>
                                    <td ng-bind="historial.matricula.idCarrera.nombreCarrera"></td>
                                    <td ng-bind="historial.matricula.idGrupoActual.cuatrimestre"></td>
                                    <td ng-bind="historial.matricula.idGrupoActual.grupo | uppercase "></td>
                                    <td ng-bind="historial.noAsesorias"></td>

                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="8" class="text-center">
                                            <div st-pagination="" st-items-by-page="10" st-displayed-pages="5"></div>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
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