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
            background: url(/SISAASE_war_exploded/img/system/preloader.gif) center no-repeat #fff;
        }
    </style>
</head>

<body ng-controller="ControlPerfil" ng-init="consultarPerfil()">
<div class="se-pre-con text-center"></div>
<div id="wrapper">


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
            <a class="navbar-brand" href="/SISAASE_war_exploded/iniciarSesion" style="color: #FFF !important;">Sistema
                Integral de Servicios Académicos | SISA</a>
        </div>
        <!-- /.navbar-header -->

        <ul id="rightMenu" class="nav navbar-top-links navbar-right">

            <li class="dropdown">

            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" id="cerrarSesion" href="/SISAASE_war_exploded/cerrarSesion">
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
                        <h5>${sessionScope.datosPersonales.nombres} ${sessionScope.datosPersonales.aPaterno} ${sessionScope.datosPersonales.aMaterno}</h5>
                        <h4>Estudiante</h4>
                    </li>
                    <li>
                        <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/historialAcademico/historialAcademico.jsp"><i
                                class="fa fa-book fa-fw"></i> Historial académico</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-arrow-down fa-fw"></i> Asesorías<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/asesoriasAlumno/solicitarAsesoria.jsp">Solicitar
                                    asesoría</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/asesoriasAlumno/asesoriasSolicitadas.jsp">Asesorías
                                    solicitadas</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/grupos/asesoriasAlumno/historialAsesorias.jsp">Historial
                                    de asesorías</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="/SISAASE_war_exploded/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i
                                class="fa fa-file-text"></i> Evaluación docente</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-arrow-down fa-fw"></i> Bajas<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/baja/solicitudBaja/bajasRegistroSolicitud.jsp">Registrar
                                    solicitud</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/baja/historialBajas/historialBajas.jsp">Historial
                                    de bajas</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-usd fa-fw"></i> Pagos<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/pagos/pagosFicha.jsp">Fichas
                                    de pago</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/pagos/pagosHistorial.jsp">Historial
                                    de pagos</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Estadías<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/cartaPresentacion/cartaPresentacion.jsp">Carta
                                    Presentación</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/convenioIndividual/convenionIndividual.jsp">Asignación
                                    y aceptación de estadía</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/resumenEstadia/resumenEstadia.jsp">Resumen
                                    estadía</a>
                            </li>
                        </ul>
                    </li>
                    <!--            <li>
                                    <a href="/SISAASE_war_exploded/jsp/permanencia/evaluacionDocente/evaluacion/inicioEvaluacionDocente.jsp"><i class="fa fa-braille fa-fw"></i> Evaluación Docente</a>
                                </li>-->
                    <li>
                        <a href="/SISAASE_war_exploded/jsp/permanencia/perfil/alumno/perfilAlumno.jsp"><i
                                class="fa fa-user-o fa-fw"></i>Mi Perfil</a>
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
                                        <a href="/SISAASE_war_exploded/cambiarSesion?idRolCambiar=Alumno&rolCambiar=Estudiante"
                                           style="color: white;">
                                            <div class="col-md-8">Estudiante</div>
                                            <div class="col-md-4 text-right"><span class="text-right"><i
                                                    class="fa fa-angle-right"></i></span></div>
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
                    <button type="submit" class="btn btn-default btn-default pull-right" data-dismiss="modal">Cerrar
                    </button>
                </div>
            </div>
        </div>
    </div>

    <div id="page-wrapper">
        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">Mi perfil</div>
            <div class="panel-body" style="padding-top: 0px;">
                <div>
                    <div class="row ">
                        <div class="col-md-16">
                            <!--<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>-->
                            <div class="fb-profile">
                                <img align="left" class="fb-image-lg" src="/SISAASE_war_exploded/img/utez/header-bg.jpg"
                                     alt="Profile image example"/>
                                <img align="left" class="fb-image-profile thumbnail"
                                     src="/SISAASE_war_exploded/img/system/photo.jpg" alt="Profile image example"/>
                                <div class="fb-profile-text">
                                    <h1 ng-class="{'text-danger':perfil.status !== 'Activo'}" style="margin-top: 0px;">
                                        <span ng-bind="perfil.nombres + ' ' + perfil.aPaterno + ' ' + perfil.aMaterno"></span><br/><span
                                            ng-bind="perfil.matricula"></span></h1>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">Información Académica</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="form-group col-md-12 text-center">
                                            <label for="">Carrera:</label>
                                            <h2 class="text-primary" ng-bind="carreraPerfil"></h2>
                                        </div>
                                    </div>
                                    <br/>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="">Cuatrimestre:</label>
                                            <div ng-bind="perfil.idGrupoActual.cuatrimestre"></div>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="">Grupo:</label>
                                            <div ng-bind="perfil.idGrupoActual.grupo"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Generación Ingreso:</label>
                                                <div>No. <span ng-bind="perfil.genIngreso"></span></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Generación Egreso:</label>
                                                <div>No. <span ng-bind="perfil.genEgreso"></span></div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Plan de estudios:</label>
                                                <div ng-bind="perfil.planEstudios"></div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="">Estado académico:</label>
                                                <div ng-bind="perfil.status"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form role="form" name="form1" novalidate>
                        <div class="row ">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">Información Personal</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group"
                                                     ng-class="{'has-success': form1.nombres.$valid, 'has-error': form1.nombres.$invalid && form1.nombres.$dirty}">
                                                    <label class="control-label" for="nombres">Nombre: </label>
                                                    <input type="text" class="form-control" id="nombres" name="nombres"
                                                           ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñ ]{3,50}$/"
                                                           ng-model="perfil.nombres" maxlength="50" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group"
                                                     ng-class="{'has-success': form1.aPaterno.$valid, 'has-error': form1.aPaterno.$invalid && form1.aPaterno.$dirty}">
                                                    <label class="control-label" for="aPaterno">Primer apellido: </label>
                                                    <input type="text" class="form-control" id="aPaterno" name="aPaterno"
                                                           ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñ ]{3,40}$/"
                                                           ng-model="perfil.aPaterno" maxlength="40" required/>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group"
                                                     ng-class="{'has-success': form1.aMaterno.$valid, 'has-error': form1.aMaterno.$invalid && form1.aMaterno.$dirty}">
                                                    <label class="control-label" for="aMaterno">Segundo apellido: </label>
                                                    <input type="text" class="form-control" id="aMaterno" name="aMaterno"
                                                           ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñ ]{3,40}$/"
                                                           ng-model="perfil.aMaterno" maxlength="40"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group"
                                                     ng-class="{'has-success': form1.estadoCivil.$valid, 'has-error': form1.estadoCivil.$invalid && form1.estadoCivil.$dirty}">
                                                    <label class="control-label" for="estadoCivil">Estado civil: </label>
                                                    <select class="form-control" id="estadoCivil" name="estadoCivil"
                                                            ng-model="perfil.estadoCivil" required>
                                                        <option value="" selected="">Seleccione...</option>
                                                        <option value="Soltero(a)">Soltero(a)</option>
                                                        <option value="Casado(a)">Casado(a)</option>
                                                        <option value="Viudo(a)">Viudo(a)</option>
                                                        <option value="Divorciado(a)">Divorciado(a)</option>
                                                        <option value="Unión Libre">Unión libre</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 form-group"
                                                 ng-class="{'has-success': form1.curp.$valid, 'has-error': form1.curp.$invalid && form1.curp.$dirty}">
                                                <label class="control-label" for="curp">CURP: </label>
                                                <input type="text" class="form-control" name="curp" id="curp" readonly=""
                                                       ng-model="perfil.curp" required/>
                                            </div>


                                            <div class="col-md-4 form-group"
                                                 ng-class="{'has-success': form1.noIMSS.$valid, 'has-error': form1.noIMSS.$invalid && form1.noIMSS.$dirty}">
                                                <label class="control-label" for="noIMSS">Número IMSS: </label>
                                                <input type="text" class="form-control" name="noIMSS" id="noIMSS"
                                                       readonly="" ng-model="perfil.noIMSS" required/>
                                            </div>
                                            <div class="col-md-4 form-group"
                                                 ng-class="{'has-success': form1.sexo.$valid, 'has-error': form1.sexo.$invalid && form1.sexo.$dirty}">
                                                <label class="control-label" for="sexo">Sexo: </label>
                                                <br/>
                                                <div class="text-center">
                                                    <label class="checkbox-inline">
                                                        <input type="radio" name="sexo" ng-model="perfil.sexo" id="sexoM"
                                                               value="Masculino" required><strong>Masculino</strong>
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="radio" name="sexo" ng-model="perfil.sexo" id="sexoF"
                                                               value="Femenino" required><strong>Femenino</strong>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 form-group"
                                                 ng-class="{'has-success': form1.fechaNacimiento.$valid, 'has-error': form1.fechaNacimiento.$invalid && form1.fechaNacimiento.$dirty}">
                                                <label class="control-label" for="fechaNacimiento">Fecha de
                                                    nacimiento: </label>

                                                <div class="input-group">
                                                    <input type="text" class="form-control" name="fechaNacimiento"
                                                           id="fechaNacimiento" ng-model="modDate"
                                                           uib-datepicker-popup="{{format}}" is-open="status.opened"
                                                           datepicker-options="dateOptions" ng-required="true"
                                                           show-button-bar="false" show-weeks="false" required readonly/>
                                                    <div class="input-group-btn">
                                                        <a class="btn btn-default"><i class="fa fa-calendar"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 form-group"
                                                 ng-class="{'has-success': form1.edad.$valid, 'has-error': form1.edad.$invalid && form1.edad.$dirty}">
                                                <label class="control-label" for="edad">Edad: </label>
                                                <input type="number" class="form-control" name="edad" id="edad" readonly=""
                                                       ng-model="perfil.edad" required min="18 "/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-8 text-center">
                                                <button class="btn btn-success" ng-click="guardarInformacion()"
                                                        ng-disabled="form1.$pristine || !form1.$valid">Registrar
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Domicilio actual
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-md-12"
                                                 ng-class="{'has-success': form1.domActual.$valid, 'has-error': form1.domActual.$invalid && form1.domActual.$dirty}">
                                                <label class="control-label" for="domActual">Domicilio: </label>
                                                <input type="text" class="form-control" name="domActual" id="domActual"
                                                       ng-model="perfil.domActual" maxlength="60" required/>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form1.colonia.$valid, 'has-error': form1.colonia.$invalid && form1.colonia.$dirty}">
                                                <label class="control-label" for="colonia">Colonia: </label>
                                                <input type="text" class="form-control" name="colonia" id="colonia"
                                                       ng-model="perfil.colonia" maxlength="45" required/>
                                            </div>
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form1.cp.$valid, 'has-error': form1.cp.$invalid && form1.cp.$dirty}">
                                                <label class="control-label" for="cp">Código postal: </label>
                                                <input type="number" class="form-control" name="cp" id="cp"
                                                       ng-model="perfil.cp" minlength="5" maxlength="5" required/>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form1.nacionalidad.$valid, 'has-error': form1.nacionalidad.$invalid && form1.nacionalidad.$dirty}">
                                                <label class="control-label" for="nacionalidad">Nacionalidad: </label>
                                                <input type="text" class="form-control" name="nacionalidad"
                                                       id="nacionalidad" readonly ng-model="perfil.nacionalidad"
                                                       maxlength="50" required/>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form1.telefono.$valid, 'has-error': form1.telefono.$invalid && form1.telefono.$dirty}">
                                                <label class="control-label" for="telefono">Teléfono: </label>
                                                <input type="text" class="form-control" name="telefono" id="telefono"
                                                       ng-model="perfil.telefono" maxlength="15" required/>

                                            </div>
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form1.cel.$valid, 'has-error': form1.cel.$invalid && form1.cel.$dirty}">
                                                <label class="control-label" for="cel">Celular: </label>
                                                <input type="text" class="form-control" name="cel" id="cel"
                                                       ng-model="perfil.cel" maxlength="15" required/>
                                            </div>
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form1.email.$valid, 'has-error': !form1.email.$valid && form1.email.$dirty}">
                                                <label class="control-label" for="email">Correo electrónico: </label>
                                                <input type="email" class="form-control" name="email" id="email"
                                                       ng-model="perfil.email" maxlength="40" required/>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-8 text-center">
                                                <button class="btn btn-success" ng-click="guardarInformacion()"
                                                        ng-disabled="form1.$pristine || !form1.$valid">Registrar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>


                    <form role="form" name="form2">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Cambio de contraseña
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form2.nuevaContrasexa.$valid, 'has-error': form2.nuevaContrasexa.$invalid && form2.nuevaContrasexa.$dirty}">
                                                <label class="control-label" for="nuevaContrasexa">Nueva
                                                    contraseña: </label>
                                                <input type="password" class="form-control" name="nuevaContrasexa"
                                                       id="nuevaContrasexa"
                                                       ng-pattern="/^((?=.*\d)(?=.*[A-Za-z]).{8,30})$/"
                                                       ng-model="usuario.nuevaContrasexa" maxlength="30" required/>
                                                <div ng-show="(form2.nuevaContrasexa.$dirty && form2.nuevaContrasexa.$invalid)"
                                                     class="alert alert-warning">
                                                    La nueva contraseña no cumple con el formato requerido, tamaño
                                                    minimo de 8 y al menos 1 numero.<strong class="alert-link"> Ejemplo:
                                                    abcdef123</strong>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success':form2.confirmaContrasexa.$valid, 'has-error': form2.confirmaContrasexa.$invalid && form2.confirmaContrasexa.$dirty}">
                                                <label class="control-label" for="confirmaContrasexa">Confirmar
                                                    contraseña: </label>
                                                <input type="password" class="form-control" name="confirmaContrasexa"
                                                       id="confirmaContrasexa"
                                                       ng-pattern="/^((?=.*\d)(?=.*[A-Za-z]).{8,30})$/"
                                                       ng-model="usuario.confirmaContrasexa" maxlength="30" required/>
                                                <div ng-show="form2.confirmaContrasexa.$dirty && (usuario.nuevaContrasexa !== usuario.confirmaContrasexa)"
                                                     class="alert alert-warning">
                                                    <strong class="alert-link">Confirmación incorrecta</strong>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4"
                                                 ng-class="{'has-success': form2.contrasexa.$valid, 'has-error': form2.contrasexa.$invalid && form2.contrasexa.$dirty}">
                                                <label class="control-label" for="contrasexa">Contraseña
                                                    actual: </label>
                                                <input type="password" class="form-control" name="contrasexa"
                                                       id="contrasexa" ng-model="usuario.contrasexa" maxlength="30"
                                                       required/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4 col-md-offset-8 text-center">
                                                <button class="btn btn-success"
                                                        ng-disabled="!form2.$valid || (usuario.nuevaContrasexa !== usuario.confirmaContrasexa)"
                                                        ng-click="modificarContrasexa()">Modificar
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                </div>
                <div ng-show="!perfil" class="text-center">
                    <img src="/SISAASE_war_exploded/img/system/preloader.gif"/>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-wrapper -->
</div>
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

