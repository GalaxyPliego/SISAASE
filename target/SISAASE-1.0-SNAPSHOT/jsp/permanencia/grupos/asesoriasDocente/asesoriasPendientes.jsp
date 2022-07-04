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

<body ng-controller="ControlPerfil" ng-init="consultarPerfil()">
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
                        <h5>Roy Axxel Salgado Mart&iacute;nez</h5>
                        <h4>Estudiante</h4>
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
            <div class="panel-heading">Asesorías pendientes</div>
            <div class="panel-body">
<%--                <div ng-show="!historial" class="text-center ng-hide">--%>
<%--                    <img src="SISAASE_war_exploded/preloader.gif">--%>
<%--                </div>--%>
<%--                <div ng-show="historial" class="row">--%>
    <div class="row">
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
                                <tr class="ng-scope">

                                    <td class="ng-binding">1</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#F0AD4E ;">Pendiente</td>
                                    <td class="ng-binding"><button class="btn btn-success" onclick="modalAceptarR()"><i class="fa fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                <tr class="ng-scope">
                                    <td class="ng-binding">2</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#F0AD4E ;">Pendiente</td>
                                    <td class="ng-binding"><button class="btn btn-success" onclick="modalAceptarR()"><i class="fa fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                <tr class="ng-scope">
                                    <td class="ng-binding">3</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#F0AD4E ;">Pendiente</td>
                                    <td class="ng-binding"><button class="btn btn-success" onclick="modalAceptarR()"><i class="fa fa-search"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->

                                </tbody></table>
                        </div>
                        <center>
                            <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">2 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">3 <span class="sr-only">(current)</span></a></li>
                                    <li ><a href="#">4 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                        </center>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading">Asesorías aceptadas</div>
                </div>
                <div class="row">
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
                                <tr class="ng-scope">

                                    <td class="ng-binding">1</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#069779 ;">Aceptada</td>
                                    <td class="ng-binding"><button class="btn btn-success" onclick="modalFinalizar()" style="margin-right:5px ;"><i class="fa fa-search"></i></button><button class="btn btn-danger" onclick="modalCancelar()"><i class="fa fa-calendar-times-o"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                <tr class="ng-scope">
                                    <td class="ng-binding">2</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#069779 ;">Aceptada</td>
                                    <td class="ng-binding"><button class="btn btn-success" style="margin-right:5px ;" onclick="modalFinalizar()"><i class="fa fa-search"></i></button><button class="btn btn-danger" onclick="modalCancelar()"><i class="fa fa-calendar-times-o"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->
                                <tr class="ng-scope">
                                    <td class="ng-binding">3</td>
                                    <td class="ng-binding">2021//05//20</td>
                                    <td class="ng-binding">14:00</td>
                                    <td class="ng-binding">Nathaly Escalona Ruiz</td>
                                    <td class="ng-binding">Sentencias MySQL</td>
                                    <td class="ng-binding" style="color:#069779 ;">Aceptada</td>
                                    <td class="ng-binding"><button class="btn btn-success" style="margin-right:5px ;" modalFinalizar()><i class="fa fa-search"></i></button><button class="btn btn-danger" onclick="modalCancelar()"><i class="fa fa-calendar-times-o"></i></button></td>
                                </tr><!-- end ngRepeat: pago in historial.lista -->

                                </tbody></table>
                        </div>
                        <center>
                            <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">2 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#">3 <span class="sr-only">(current)</span></a></li>
                                    <li ><a href="#">4 <span class="sr-only">(current)</span></a></li>
                                    <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                                </ul>
                            </nav>
                        </center>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- /#page-wrapper -->
</div>


<!--Modal aceptar o rechazar asesoría -->
<div class="modal fade" id="aceptarRechazar" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#345177; color: white;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        style="color: white ;"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Aceptar / rechazar Asesoría</h4>
            </div>
            <div class="modal-body">

                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#676F77; color: white;">Información del estudiante
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >Nombre:</label>
                                <div>Nathaly Escalona Ruiz
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Matrícula:</label>
                                <div >20203TN082</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Carrera:</label>
                                <div >Desarrollo de Software
                                    Multiplataforma</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Grado:</label>
                                    <div><span >6</span></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Grupo:</label>
                                    <div><span >C</span></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Riesgo:</label>
                                    <div> <span >No</span></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#676F77; color: white;">Información Académica</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >Fecha:</label>
                                <div >04/02/2022</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Hora:</label>
                                <div >14:00</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Asignatura:</label>
                                <div >Base de Datos</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Tema:</label>
                                    <div><span >Sentencias
                                                MySQL</span></div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label >Dudas Específicas:</label>
                                    <div><span >Sentencias
                                                básicas, create, alter table, etc.</span></div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#676F77; color: white;">Información Académica</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >¿Aceptar asesoría?:</label>

                                <div>
                                    <!--<input type="text" class="form-control" id="sexo"  value="{{perfil.sexo}}" />-->
                                    <label class="checkbox-inline">
                                        <input type="radio" name="sexo"  id="siu" value="0"
                                               required=""
                                        ><strong>Si</strong>
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="sexo"  id="nou" value="1"
                                               required=""
                                        ><strong>No</strong>
                                    </label>

                                </div>


                            </div>
                            <div class="form-group col-md-8" hidden="true" id="motivosRechazo">



                                <label class="checkbox-inline">
                                    <strong>Motivos</strong>
                                    <br>
                                    <input type="text" name="sexo"
                                           placeholder="Motivos" required=""
                                    >
                                </label>


                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">

                    <!--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>-->
                    <!--<button id="aceptar" type="button" class="btn" style="background-color:#019979 ; color: white;">Aceptar</button>-->
                    <input class="btn"  id="aceptarR" value="Aceptar" type="button" style="background-color:#019979 ; color: white;" ></input>
                    <input  hidden="true" id="rechazarR" value="Rechazar" type="button" style="background-color:tomato ; color: white;" ></input>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>

<!-- Modal Finalizar asesoría -->
<div class="modal fade" id="finalizar" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background-color:#345177; color: white;">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        style="color: white ;"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Asesoría Impartida</h4>
            </div>
            <div class="modal-body">

                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#676F77; color: white;">Información del estudiante
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >Nombre:</label>
                                <div >Nathaly Escalona Ruiz
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Matrícula:</label>
                                <div >20203TN082</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Carrera:</label>
                                <div >Desarrollo de Software
                                    Multiplataforma</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Grado:</label>
                                    <div><span >6</span></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Grupo:</label>
                                    <div><span >C</span></div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Riesgo:</label>
                                    <div> <span >No</span></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#676F77; color: white;">Información Académica</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >Fecha:</label>
                                <div >04/02/2022</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Hora:</label>
                                <div >14:00</div>
                            </div>
                            <div class="form-group col-md-4">
                                <label >Asignatura:</label>
                                <div >Base de Datos</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label >Tema:</label>
                                    <div><span >Sentencias
                                                MySQL</span></div>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label >Dudas Específicas:</label>
                                    <div><span >Sentencias
                                                básicas, create, alter table, etc.</span></div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" style="background:#676F77; color: white;">Asistencia</div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label >¿Asistió el estudiante?:</label>

                                <div>
                                    <!--<input type="text" class="form-control" id="sexo"  value="{{perfil.sexo}}" />-->
                                    <label class="checkbox-inline">
                                        <input type="radio" name="sexo"  id="siS" value="0"
                                               required=""
                                        ><strong>Si</strong>
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="radio" name="sexo"  id="noN" value="1"
                                               required=""
                                        ><strong>No</strong>
                                    </label>

                                </div>


                            </div>
                            <div class="form-group col-md-8" hidden="true" id="duracion">

                                <label class="checkbox-inline">
                                    <strong>Duración en minutos</strong>
                                    <br>
                                    <input type="text" name="sexo"
                                           placeholder="30" required=""
                                    >
                                </label>


                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">

                    <button type="button" class="btn" data-dismiss="modal" style="background-color:#6C757D; color:white">Cerrar</button>
                    <button id="aceptarF" type="button" class="btn" style="background-color:#019979 ; color: white;">Aceptar</button>
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
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        style="color: white ;"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Cancelación Asesoría</h4>
            </div>
            <div class="modal-body" >


                <div class="row">
                    <div class="form-group col-md-12">
                        <label >Motivos de cancelación :</label>
                        <br>
                        <input type="text" name="sexo" id="motCancelacion" style="width: 100%; height: 50px"
                               placeholder="Motivos" required=""
                        >

                    </div>

                </div>

                <div class="modal-footer">

                    <button type="button" class="btn" data-dismiss="modal" style="background-color:#6C757D; color:white">Cerrar</button>
                    <button id="aceptar" type="button" class="btn" style="background-color:#019979 ; color: white;">Aceptar</button>
                    <!--<input class="btn"  id="aceptar" value="Guardar" type="button" style="background-color:#019979 ; color: white;" ></input>-->
                    <!--<input  hidden="true" id="rechazar" value="Cerrar" type="button" style="background-color:tomato ; color: white;" ></input>-->
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</div>


<script>
    var discounted = document.getElementById('siu');
    var no_discounted = document.getElementById('nou')
    var discount_percentage = document.getElementById('motivosRechazo')
    var aceptarR = document.getElementById('aceptarR');
    var rechazarR= document.getElementById('rechazarR')
    function updateStatus() {
        if (discounted.checked) {
            discount_percentage.hidden = true;
            rechazarR.classList.remove("btn");
            aceptarR.classList.add("btn");
            rechazarR.hidden = true;
            aceptarR.hidden = false;

        } else {
            discount_percentage.hidden = false;
            aceptarR.classList.remove("btn");
            rechazarR.classList.add("btn");
            rechazarR.hidden = false;
            aceptarR.hidden = true;

        }
    }

    discounted.addEventListener('change', updateStatus)
    no_discounted.addEventListener('change', updateStatus)
</script>

<script>
    const modalAceptarR = () => {

        $('#aceptarRechazar').modal('show')
        $("#motivosRechazo").val("");
        $("#siu input [type='checkbox']").prop('checked', false).change();
        $("#nou input [type='checkbox']").prop('checked', false).change();
    }

</script>

<script>
    var discounteds = document.getElementById('siS');
    var no_discounteds = document.getElementById('noN')
    var discount_percentages = document.getElementById('duracion')
    function updateStatus() {
        if (discounteds.checked) {
            discount_percentages.hidden = false;
        } else {
            discount_percentages.hidden = true;
        }
    }

    discounteds.addEventListener('change', updateStatus)
    no_discounteds.addEventListener('change', updateStatus)
</script>

<script>


    const modalFinalizar = () => {

        $('#finalizar').modal('show')
        $("#duracion").val("");

        $("#siS input[type='checkbox']").prop('checked', false).change();
        $("#noN input[type='checkbox']").prop('checked', false).change();
    }




</script>

<script>
    const modalCancelar = () => {

        $('#cancelar').modal('show')
        $("#motCancelacion").val("");

    }

</script>



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
<script src="/SISAASE_war_exploded/js/control/permanencia/perfil/ajsControlPerfil.js"></script>



<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>
<script src="/SISAASE_war_exploded/js/ui-bootstrap-tpls-0.14.3.js"></script>




</body>

</html>

