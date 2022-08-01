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

<body ng-controller="historialGeneral" ng-init="">
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
            <div class="panel-heading">Historial General de Asesorías</div>
            <!-- Panel body -->
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3 col-md-offset-3">
                        <!-- filtrado con un select por periodo cuatrimestral -->
                        <div class="form-group" ng-init="findPeriodoCuatrimestral()">
                            <label for="periodoCuatrimestral">Periodo Cuatrimestral:</label>
                            <select class="form-control" id="periodoCuatrimestral" ng-model="periodoCuatrimestral" ng-options="periodoCuatrimestral.nombreCuatrimestre for periodoCuatrimestral in arrayPeriodoCuatrimestral track by periodoCuatrimestral.idPeriodoCuatrimestral" ng-change="cambioPeriodoCarrera(periodoCuatrimestral, carrera)" >
                                <option value="" autofocus>Seleccione un periodo</option>
                                <!--<option ng-repeat="periodo in periodos" value="{{periodo.id}}">{{periodo.periodo}}</option>-->
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 ">
                        <!-- filtrado con un select por periodo cuatrimestral -->
                        <div class="form-group" ng-init="findCarreras()">
                            <label for="carreras">Carrera:</label>
                            <select class="form-control" id="carreras" ng-model="carrera" ng-options="carrera.nombreCarrera for carrera in arrayCarreras track by carrera.idCarrera" ng-change="cambioPeriodoCarrera(periodoCuatrimestral, carrera)">
                                <option value="">Seleccione una carrera</option>
                                <option value="" ></option>
                                <!--<option ng-repeat="periodo in periodos" value="{{periodo.id}}">{{periodo.periodo}}</option>-->
                            </select>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table ng-init="" st-safe-src="arrayHistorialGeneral" st-table="displayCollection" st-set-filter="myStrictFilter" class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <th rowspan="2">#</th>
                                    <th st-sort="matricula">Matrícula</th>
                                    <th st-sort="alumno">Alumno</th>
                                    <th st-sort="sexo">Sexo</th>
                                    <th st-sort="carrera">Carrera</th>
                                    <th st-sort="cuatrimestre">Cuatrimestre</th>
                                    <th st-sort="grupo">Grupo</th>
                                    <th st-sort="riesgo">Riesgo</th>
                                    <th st-sort="fecha">fecha</th>
                                    <th st-sort="docente">Docente</th>
                                    <th st-sort="asignatura">Asignatura</th>
                                    <th st-sort="tema">Tema</th>
                                    <th st-sort="aclaracionDudas">¿Aclaró dudas?</th>
                                    <th st-sort="estado">Estado</th>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->
                                <tr>
                                    <td></td>
                                    <td><input st-search="matricula" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="nombre" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="sexo" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td></td>
                                    <td><input st-search="grado" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="grupo" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="riesgo" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="fecha" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="docente" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="asignatura" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td></td>
                                    <td></td>
                                    <td><input st-search="estado" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                </tr>
                                <tr ng-repeat="historial in displayCollection | orderBy : 'fecha' " class="ng-scope">

                                    <td ng-cloak ng-bind="$index + 1"> </td>
                                    <td ng-cloak ng-bind="historial.matricula.matricula | uppercase "></td>
                                    <td ng-cloak ng-bind="(historial.matricula.nombres) + ' ' + ( historial.matricula.aPaterno )"></td>
                                    <td ng-cloak ng-bind="historial.matricula.sexo"></td>
                                    <td ng-cloak ng-bind="historial.matricula.idCarrera.nombreCarrera"></td>
                                    <td ng-cloak ng-bind="historial.matricula.idGrupoActual.cuatrimestre"></td>
                                    <td ng-cloak ng-bind="historial.matricula.idGrupoActual.grupo | uppercase "></td>
                                    <td ng-cloak ><span ng-if="historial.riesgo == 0">No</span><span  ng-if="historial.riesgo == 1">Sí</span></td>
                                    <td ng-cloak ng-bind="historial.fechaAsesoria"></td>
                                    <td ng-cloak ng-bind="(historial.idProfesor.nombres) + ' ' + (historial.idProfesor.aPaterno)"></td>
                                    <td ng-cloak ng-bind="historial.idMateria.nombre"></td>
                                    <td ng-cloak ng-bind="historial.tema"></td>
                                    <td ng-cloak ><span ng-if="historial.aclaracionDudas == 0">No</span><span  ng-if="historial.aclaracionDudas == 1">Sí</span></td>
                                    <td ng-cloak ng-bind="historial.idEstadoAsesoria.nombre"><span ng-if="historial.idEstadoAsesoria.nombre == 'Aceptada'">{{historial.idEstadoAsesoria.nombre}}</span><span  ng-if="historial.idEstadoAsesoria.nombre == 'Finalizada'">{{historial.idEstadoAsesoria.nombre}}</span><span  ng-if="historial.idEstadoAsesoria.nombre == 'Cacncelada'"><a ng-click="detailMotivosCancelacion(historial)" style="color: red">  {{historial.idEstadoAsesoria.nombre}}</a></span><span  ng-if="historial.idEstadoAsesoria.nombre == 'Rechazada'"><a ng-click="detailMotivosRechazo(historial)" style="color: red">  {{historial.idEstadoAsesoria.nombre}}</a></span></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="14" class="text-center">
                                        <div st-pagination="" st-items-by-page="10" st-displayed-pages="5"></div>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>

                            <div class="text-center" ng-if="cantidadHistorialDocente" >
                                <div class="alert alert-warning alert-dismissible" role="alert">
                                    <strong>No hay registro en este Periodo Cuatrimestral</strong>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->

    <!-- Modal Cacncelacion -->
    <div class="modal fade bs-example-modal-lg" id="modalDetallesCancelacion" tabindex="-1" aria-labelledby="modalDetails" aria-hidden="true">
        <div class="modal-dialog modal-lg" >
            <div class="modal-content" style="background-color: #F2F2F2 ">
                <div class="modal-header" style="background-color: #345177; padding-left: 30px; padding-right: 30px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" style="color: white; font-weight: bold; margin:0px;">Información de Cancelación</h4>
                </div>
                <div class="modal-body" style="padding-left: 30px; padding-right: 30px; padding-bottom: 20px; padding-top: 20px;">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-xs-12 " style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Cancelada por</label>
                                <p class="text__modal" ng-bind="detailMotivosCancelacion.rolCancelacion"></p>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Hora de Cancelación</label>
                                <p class="text__modal" ng-bind="detailMotivosCancelacion.horaCancelacion"></p>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Motivos de Cancelación</label>
                                <p class="text__modal" ng-bind="detailMotivosCancelacion.motivosCancelacion"></p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #676F77; color: white;">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Rechazo -->
    <div class="modal fade bs-example-modal-lg" id="modalDetallesRechazo" tabindex="-1" aria-labelledby="modalDetails" aria-hidden="true">
        <div class="modal-dialog modal-lg" >
            <div class="modal-content" style="background-color: #F2F2F2 ">
                <div class="modal-header" style="background-color: #345177; padding-left: 30px; padding-right: 30px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" style="color: white; font-weight: bold; margin:0px;">Información de Rechazo</h4>
                </div>
                <div class="modal-body" style="padding-left: 30px; padding-right: 30px; padding-bottom: 20px; padding-top: 20px;">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-xs-12 " style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Rechazada por</label>
                                <p class="text__modal" >Docente</p>
                            </div>
                        </div>
                        <div class="col-lg-12 col-md-12 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Motivos de Rechazo</label>
                                <p class="text__modal" ng-bind="detailMotivosRechazo.motivosRechazo"></p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="background-color: #676F77; color: white;">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

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