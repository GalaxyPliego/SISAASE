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

        .text__modal{
            font-size: 16px;
        }
        .label__modal{
            font-size: 18px;
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

<body ng-controller="historialDocente" ng-init="">
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
                        <div class="form-group">
                            <label for="periodo">Periodo Cuatrimestral:</label>
                            <select class="form-control" id="periodo" ng-model="periodo" ng-change="cambioPeriodo()">
                                <option value="">Seleccione un periodo</option>
                                <option >Opcion 1</option>
                                <option >Opcion 2</option>
                                <!--<option ng-repeat="periodo in periodos" value="{{periodo.id}}">{{periodo.periodo}}</option>-->
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table st-safe-src="rowCollection" st-table="displayCollection" st-set-filter="myStrictFilter" class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <th>#</th>
                                    <th st-sort="fecha">Fecha</th>
                                    <th st-sort="matricula">Matricula</th>
                                    <th st-sort="alumno">Alumno</th>
                                    <th st-sort="asignatura">Asignatura</th>
                                    <th st-sort="tema">Tema</th>
                                    <th st-sort="estado">Estado</th>
                                    <th st-sort="detalles">Detalles</th>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->
                                <tr>
                                    <td></td>
                                    <td><input st-search="fecha" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="matricula" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="alumno" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="asignatura" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td><input st-search="tema" class="input-sm form-control" type="search" placeholder="Buscar"/></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr ng-repeat="row in displayCollection | orderBy : 'fecha'" class="ng-scope">

                                    <td ng-bind="$index + 1"> </td>
                                    <td ng-bind="row.fecha"></td>
                                    <td ng-bind="row.matricula"></td>
                                    <td ng-bind="row.alumno"></td>
                                    <td ng-bind="row.asignatura"></td>
                                    <td ng-bind="row.tema"></td>
                                    <td ng-bind="row.estado "></td>
                                    <td class="text-center" style="color: #009574; font-size: 18px"> <i ng-click="s" data-toggle="modal" data-target="#modalDetails"  class="fa fa-search-plus" aria-hidden="true" style="cursor: pointer"></i> </td>

                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="8" class="text-center">
                                        <div style="cursor:pointer;" st-pagination="" st-items-by-page="10" st-displayed-pages="5" st-page-change="onPage"></div>
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

    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="modalDetails" tabindex="-1" role="dialog" aria-labelledby="modalDetails" >
        <div class="modal-dialog modal-lg" >
            <div class="modal-content" style="background-color: #F2F2F2 ">
                <div class="modal-header" style="background-color: #345177; padding-left: 30px; padding-right: 30px;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel" style="color: white; font-weight: bold; margin:0px;">Información Adicional</h4>
                </div>
                <div class="modal-body" style="padding-left: 30px; padding-right: 30px; padding-bottom: 20px; padding-top: 20px;">
                    <h3 class="" style="margin-top: 0; margin-bottom: 20px; color: #345177; font-weight: bold;">Información del Alumno</h3>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-xs-12 " style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Nombre</label>
                                <p class="text__modal">Carlos Ricardo Espinoza Pliego</p>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Matrícula</label>
                                <p class="text__modal">20203TN129</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12 " style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Carrera</label>
                                <p class="text__modal">Ingeniería en Desarrollo y Gestión de Software</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Grado</label>
                                <p class="text__modal">6</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Grupo</label>
                                <p class="text__modal">A</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Riesgo</label>
                                <p class="text__modal">No</p>
                            </div>
                        </div>
                    </div>

                    <h3 class="" style="margin-top: 0; margin-bottom: 20px; color: #345177; font-weight: bold;">Información de la Asesoría</h3>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-xs-12 " style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Fecha</label>
                                <p class="text__modal">24/01/2022</p>

                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Hora</label>
                                <p class="text__modal">13:00 - 14:00</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12 " style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Duración (minutos) </label>
                                <p class="text__modal">44</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Asignatura</label>
                                <p class="text__modal">Base de Datos</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Tema</label>
                                <p class="text__modal">Consultas Avanzadas</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">¿Resolvió dudas?</label>
                                <p class="text__modal">No</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Estado</label>
                                <p class="text__modal">Pendiente</p>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Dudas específicas</label>
                                <p class="text__modal">Estructura básica de las consultas y casos de uso en los que se pueden utilizar</p>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-6 col-xs-12" style="margin-bottom: 10px">
                            <div class="form-group">
                                <label class="label__modal" for="">Motivos de Cancelación</label>
                                <p class="text__modal">Tuve una reunión de imprevisto muy importante, una disculpa de antemano. Puedes agendar otra asesoría en estos días, saludos.</p>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-6 col-xs-12" style="margin-bottom: 10px" >
                            <div class="form-group">
                                <label for="" class="label__modal" >Motivos de Rechazo</label>
                                <p class="text__modal">Ese día ya tengo ocupado esa hora para otras asesorias, puedes solicitar otra en estos días.</p>
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
<script src="/SISAASE_war_exploded/js/control/permanencia/grupos/asesoriasDocente/historialDocente.js"></script>


<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>
<script src="/SISAASE_war_exploded/js/ui-bootstrap-tpls-0.14.3.js"></script>
<script src="/SISAASE_war_exploded/js/smart-table.min.js"></script>

</body>

</html>