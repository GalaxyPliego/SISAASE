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

<body ng-controller="ControlAsesoriasDocente" ng-init="consultarPerfil()">
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
        <!-- /.navbar-top-links -->

        <!DOCTYPE html>
        <div id="leftMenu" class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search text-center hidden-xs " style="background-color: #fff;padding: 15px 0 5px 0;">
                        <img width="100%" src="/SISAASE_war_exploded/img/utez/lenguaje-incluyente.png" />
                    </li>
                    <li class="sidebar-search text-center" style="color: #fff;">
                        <h5>Nathaly Escalona Ruiz</h5>
                        <h4>Docente</h4>
                    </li>
                    <li>
                        <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/historialAcademico/historialAcademico.jsp"><i class="fa fa-book fa-fw"></i> Historial académico</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-arrow-down fa-fw"></i> Asesorías<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/asesoriasAlumno/solicitarAsesoria.jsp">Solicitar asesoría</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/asesoriasAlumno/asesoriasSolicitadas.jsp">Asesorías solicitadas</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/asesoriasAlumno/historialAsesorias.jsp">Historial de asesorías</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
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
    <div id="page-wrapper">
        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading" style="font-size:medium ">Solicitudes</div>
            <div class="panel-body">
                <%--                <div ng-show="!historial" class="text-center ng-hide">--%>
                <%--                    <img src="SISAASE_war_exploded/preloader.gif">--%>
                <%--                </div>--%>
                <%--                <div ng-show="historial" class="row">--%>
                <div class="row">
                    <div class="col-md-12">
                        <h2 style="color: #345177 ; margin-top: -5px">Asesorias pendientes</h2>

                        <div class="table-responsive">
                            <table st-table="listPending" st-safe-src="rowCollection" class="table table-bordered table-striped">
                                <thead  style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <th rowspan="2" style="vertical-align: middle">#</th>
                                    <th st-sort="fecha">Fecha</th>
                                    <th st-sort="hora">Hora</th>
                                    <th st-sort="nombre">Nombre</th>
                                    <th st-sort="tema">Tema</th>
                                    <th st-sort="estado" rowspan="2" style="vertical-align: middle">Estado</th>
                                    <th rowspan="2" style="vertical-align: middle">Acciones</th>
                                </tr>
                                <tr>
                                    <th><input st-search="fecha" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                    <th><input st-search="hora" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                    <th><input st-search="estudiante.nombre" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                    <th><input st-search="tema" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->

                                <tr class="ng-scope" ng-repeat="row in listPending | orderBy:'fecha' : reverse">

                                    <td ng-bind="$index + 1"></td>
                                    <td ng-bind="row.fecha"></td>
                                    <td ng-bind="row.hora"></td>
                                    <td ng-bind="row.estudiante.nombre"></td>
                                    <td ng-bind="row.tema"></td>
                                    <td ng-bind="row.estado.nombre" style="color:#F0AD4E ;"></td>
                                    <td class="ng-binding"><button class="btn btn-success" ng-click="modalAceptarR(row)"><i class="fa fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="7" class="text-center">
                                        <div style="cursor:pointer;" st-pagination="" st-items-by-page="10" st-displayed-pages="5"></div>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>

                <h2 style="color: #345177; margin-top: -5px">Asesorías aceptadas</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table st-table="listAccepted" st-safe-src="rowCollection2" class="table table-bordered table-striped">
                                <thead style="background-color: #676f77 ; color: #fff">
                                <tr>
                                    <th rowspan="2" style="vertical-align: middle">#</th>
                                    <th st-sort="fecha">Fecha</th>
                                    <th st-sort="hora">Hora</th>
                                    <th st-sort="nombre">Nombre</th>
                                    <th st-sort="tema">Tema</th>
                                    <th st-sort="estado" rowspan="2" style="vertical-align: middle">Estado</th>
                                    <th rowspan="2" style="vertical-align: middle">Acciones</th>
                                </tr>
                                <tr>
                                    <th><input st-search="fecha" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                    <th><input st-search="hora" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                    <th><input st-search="estudiante.nombre" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                    <th><input st-search="tema" placeholder="Buscar" class="input-sm form-control" type="search"/></th>
                                </tr>
                                </thead>
                                <tbody><!-- ngRepeat: pago in historial.lista -->

                                <tr class="ng-scope" ng-repeat="row2 in listAccepted | orderBy:'fecha' ">

                                    <td ng-bind="$index + 1"></td>
                                    <td ng-bind="row2.fecha"></td>
                                    <td ng-bind="row2.hora"></td>
                                    <td ng-bind="row2.estudiante.nombre"></td>
                                    <td ng-bind="row2.tema"></td>
                                    <td ng-bind="row2.estado.nombre" style="color:#069779 ;"></td>
                                    <td style="white-space: nowrap"><button class="btn btn-success" ng-click="modalFinalizar(row2)" style="margin-right:5px ;"><i class="fa fa-search"></i></button><button class="btn btn-danger" ng-click="modalCancelar(row2)"><i class="fa fa-calendar-times-o"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->

                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="7" class="text-center">
                                        <div style="cursor:pointer;" st-pagination="" st-items-by-page="10" st-displayed-pages="5"></div>
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


<!--Modal aceptar o rechazar asesoría -->
<form novalidate name="formularioAceptarAsesoria" id="formularioAceptarAsesoria" ng-submit="aceptarAsesoria()">
    <div class="modal fade" id="aceptarRechazar" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header" style="background-color:#345177; color: white;">
                    <button type="button" class="close" ng-click="cerrarModalAceptarR()" aria-label="Close"
                            style="color: white ;"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Aceptar / rechazar Asesoría</h4>
                </div>
                <div class="modal-body">

                    <div>
                        <h3 style="margin-left: 15px; color: #345177">Información del estudiante</h3>
                    </div>
                    <div class="panel-body" >

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >Nombre:</label>
                                <div ng-bind="infoAsesoria.estudiante.nombre">
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Matrícula:</label>
                                <div ng-bind="infoAsesoria.estudiante.matricula"></div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Carrera:</label>
                                <div ng-bind="infoAsesoria.estudiante.carrera"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Grado:</label>
                                    <div ng-bind="infoAsesoria.estudiante.grado"><span ></span></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Grupo:</label>
                                    <div ng-bind="infoAsesoria.estudiante.grupo"><span ></span></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Riesgo:</label>
                                    <div ng-bind="infoAsesoria.estudiante.riesgo"><span></span></div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div>
                        <%--                    <div >--%>
                        <h3 style="margin-left: 15px; color: #345177">Información Académica</h3>
                        <%--                    </div>--%>
                        <div class="panel-body" >
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label >Fecha:</label>
                                    <div ng-bind="infoAsesoria.fecha"></div>
                                </div>
                                <div class="form-group col-md-4">
                                    <label >Hora:</label>
                                    <div ng-bind="infoAsesoria.hora"></div>
                                </div>
                                <div class="form-group col-md-4">
                                    <label >Asignatura:</label>
                                    <div ng-bind="infoAsesoria.asignatura"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label >Tema:</label>
                                        <div ng-bind="infoAsesoria.tema"><span></span></div>
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="form-group">
                                        <label >Dudas Específicas:</label>
                                        <div ng-bind="infoAsesoria.dudas"><span></span></div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <div>
                        <div>
                            <h3 style="margin-left: 15px; color: #345177">Aceptar / rechazar asesoría académica</h3>
                        </div>
                        <div class="panel-body">

                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label >¿Aceptar asesoría?:</label>

                                    <div>
                                        <!--<input type="text" class="form-control" id="sexo"  value="{{perfil.sexo}}" />-->
                                        <label class="checkbox-inline">
                                            <input type="radio" name="aceptarRechazar"  ng-value="estados[1]"
                                                   required ng-model="infoAsesoria.estado" ng-required="true"
                                            ><strong>Si</strong>
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" name="aceptarRechazar"   ng-value="estados[2]"
                                                   required ng-model="infoAsesoria.estado"  ng-required="true"
                                            ><strong>No</strong>
                                        </label>
                                    </div>
                                </div>
                                <div ng-if="infoAsesoria.estado.nombre === 'Rechazada'" class="col-md-8"  >
                                    <label>
                                        <strong>Motivos:*</strong>

                                    </label>
                                    <textarea ng-model="infoAsesoria.motivoRechazo" class="form-control"
                                              style="resize:none;height: 50%" placeholder="Motivos de rechazo"
                                              ng-required="true" ></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">

                        <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                        <!--<button id="aceptar" type="button" class="btn" style="background-color:#019979 ; color: white;">Aceptar</button>-->
                        <button class="btn " ng-disabled="formularioAceptarAsesoria.$invalid "
                                ng-class="infoAsesoria.estado.nombre === 'Rechazada' ? 'btn-danger' : 'btn-success'"
                                ng-bind="infoAsesoria.estado.nombre === 'Rechazada' ? 'Rechazar' : 'Aceptar'"  type="submit"></button>
                        <!--{{formularioAceptarAsesoria | json}}-->
                        <button type="button" class="btn" ng-click="cerrarModalAceptarR()"  style="background-color:#6C757D; color:white">Cerrar</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</form>
</div>

<!-- Modal Finalizar asesoría -->
<div class="modal fade" id="finalizar" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#345177; color: white;">
                <button type="button" class="close" ng-click="cerrarModalFinalizar()" aria-label="Close"
                        style="color: white ;"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Asesoría Impartida</h4>
            </div>
            <div class="modal-body">


                <div>
                    <h3 style="margin-left: 15px; color: #345177">Información del estudiante</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label >Nombre:</label>
                            <div ng-bind="infoAsesoria.estudiante.nombre"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label >Matrícula:</label>
                            <div ng-bind="infoAsesoria.estudiante.matricula"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label >Carrera:</label>
                            <div ng-bind="infoAsesoria.estudiante.carrera"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label >Grado:</label>
                                <div ng-bind="infoAsesoria.estudiante.grado"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label >Grupo:</label>
                                <div ng-bind="infoAsesoria.estudiante.grupo"></div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label >Riesgo:</label>
                                <div ng-bind="infoAsesoria.estudiante.riesgo"></div>
                            </div>
                        </div>
                    </div>

                </div>


                <div>
                    <h3 style="margin-left: 15px; color: #345177">Información Académica</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label >Fecha:</label>
                            <div ng-bind="infoAsesoria.fecha"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label >Hora:</label>
                            <div ng-bind="infoAsesoria.hora"></div>
                        </div>
                        <div class="form-group col-md-4">
                            <label >Asignatura:</label>
                            <div ng-bind="infoAsesoria.asignatura"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label >Tema:</label>
                                <div ng-bind="infoAsesoria.tema"></div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label >Dudas Específicas:</label>
                                <div ng-bind="infoAsesoria.dudas"></div>
                            </div>

                        </div>
                    </div>

                </div>


                <div>
                    <h3 style="margin-left: 15px; color: #345177">Asistencia</h3>
                </div>
                <div class="panel-body">
                    <form name="formularioAsesoriaImpartida" id="formularioAsesoriaImpartida" ng-submit="aceptarAsesoriaImpartida()">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >¿Asistió el estudiante?:</label>

                                <div>
                                    <!--<input type="text" class="form-control" id="sexo"  value="{{perfil.sexo}}" />-->
                                    <label class="checkbox-inline">
                                        <input type="radio" name="asesoriaImpartida"  value="asistio"
                                               required ng-model="infoAsesoria.asistencia"
                                        ><strong>Si</strong>
                                    </label>
                                    <label class="checkbox-inline">
                                        <input  type="radio" name="asesoriaImpartida"  value="noAsistio"
                                                required ng-model="infoAsesoria.asistencia"
                                        ><strong>No</strong>
                                    </label>

                                </div>


                            </div>
                            <div ng-show="infoAsesoria.asistencia === 'asistio'" class="form-group col-md-8">

                                <label>
                                    <strong>Duración en minutos</strong>
                                    <br>
                                    <input type="number" name="duracionMin" ng-required="infoAsesoria.asistencia === 'asistio'"
                                           placeholder="30"  min="0"  ng-model="infoAsesoria.duracion"
                                    >

                                </label>


                            </div>
                        </div>
                    </form>
                </div>


                <div class="modal-footer">
                    <button ng-disabled="formularioAsesoriaImpartida.$invalid" type="submit" class="btn btn-success" form="formularioAsesoriaImpartida">Aceptar</button>
                    <button type="button" class="btn" ng-click="cerrarModalFinalizar()" style="background-color:#6C757D; color:white">Cerrar</button>

                    <!--<input class="btn"  id="aceptar" value="Guardar" type="button" style="background-color:#019979 ; color: white;" ></input>-->
                    <!--<input  hidden="true" id="rechazar" value="Cerrar" type="button" style="background-color:tomato ; color: white;" ></input>-->
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>

<!-- Modal cancelar asesoría -->
<div class="modal fade" id="cancelar" tabindex="-1" role="dialog">
    <div class="modal-dialog" style="top:25%"  role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#345177; color: white;">
                <button type="button" class="close" ng-click="cerrarModalCancelar()" aria-label="Close"
                        style="color: white ;"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Cancelación Asesoría</h4>
            </div>
            <div class="modal-body" >
                <form name="formularioCancelacionAsesoria" id="formularioCancelacionAsesoria" ng-submit="cancelarAsesoria()">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <h3 style=" color: #345177; margin-top: 5px;">Motivos de cancelación :</h3>

                            <input type="text" name="motivoCancelacion" ng-model="infoAsesoria.motivoCancelacion" style="width: 100%; height: 80px; margin-top: 5px;"
                                   placeholder="Motivos" required>
                        </div>
                    </div>
                </form>

                <div class="modal-footer">
                    <button  type="submit" class="btn btn-success" form="formularioCancelacionAsesoria" ng-disabled="formularioCancelacionAsesoria.$invalid " >Aceptar</button>
                    <button type="button" class="btn" ng-click="cerrarModalCancelar()" style="background-color:#6C757D; color:white">Cerrar</button>

                    <!--<input class="btn"  id="aceptar" value="Guardar" type="button" style="background-color:#019979 ; color: white;" ></input>-->
                    <!--<input  hidden="true" id="rechazar" value="Cerrar" type="button" style="background-color:tomato ; color: white;" ></input>-->
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>


<%--<script>--%>
<%--    const modalAceptarR = () => {--%>

<%--        $('#aceptarRechazar').modal('show')--%>
<%--        $("#motivosRechazo").val("");--%>
<%--        $("#siu input [type='checkbox']").prop('checked', false).change();--%>
<%--        $("#nou input [type='checkbox']").prop('checked', false).change();--%>
<%--    }--%>

<%--</script>--%>


<!-- /#wrapper -->
<!-- jQuery -->
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
<script src="/SISAASE_war_exploded/js/control/permanencia/grupos/asesoriasDocente/asesoriasPendientes.js"></script>



<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>
<script src="/SISAASE_war_exploded/js/ui-bootstrap-tpls-0.14.3.js"></script>
<script src="/SISAASE_war_exploded/js/smart-table.min.js"></script>



</body>

</html>

