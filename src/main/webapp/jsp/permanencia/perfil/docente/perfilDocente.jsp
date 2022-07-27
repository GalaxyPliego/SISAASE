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

<body ng-controller="ControlPerfil" ng-init="consultarPerfilProfesor()">
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

            <li class="dropdown" style="color: white; cursor: pointer;" data-toggle="modal" data-target="#myModal">
                <i class="fa fa-exchange"></i>  Roles
            </li>

            <li class="dropdown">

                <a class="dropdown-toggle" href="/SISAASE_war_exploded/docs/MU-SISA2020-DOCENTE.pdf" target="_blank">
                    <i class="fa fa-file-pdf-o fa-fw"></i> Manual
                </a>

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
                    <!--                            <li class="sidebar-search">
                                                    <div class="input-group custom-search-form">
                                                        <input type="text" class="form-control" placeholder="Search...">
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" type="button">
                                                                <i class="fa fa-search"></i>
                                                            </button>
                                                        </span>
                                                    </div>
                                                     /input-group
                                                </li>-->
                    <li class="sidebar-search text-center hidden-xs " style="background-color: #fff;padding: 15px 0 5px 0;">
                        <img width="100%" src="/SISAASE_war_exploded/img/utez/lenguaje-incluyente.png" />
                    </li>
                    <li class="sidebar-search text-center" style="color: #fff;">
                        <h4>JAZMIN ISABEL ROGEL ARIZMENDI</h4>
                        <h5>Docente</h5>
                    </li>


                    <li>
                        <a href="/SISAASE_war_exploded/jsp/permanencia/perfil/profesor/perfilProfesor.jsp"><i class="fa fa-user"></i> Mi Perfil</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-pencil-square-o"></i> Evaluaciones<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/evaluaciones/clasesProfesorPeriodoActual.jsp">Registrar evaluaciones</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/seguimiento/actaCalificacion/actaCalificacion.jsp">Historial de evaluaciones</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/solicitudesCambio/registrarModificacionPromedio.jsp">Solicitud de cambio de promedio</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="/SISAASE_war_exploded/jsp/permanencia/estadia/seguimiento/seguimientoEstadia.jsp"><i class="fa fa-th-list"></i> Seguimiento a Estadía</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-file-text-o" aria-hidden="true"></i> Evaluación docente<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/evaluacionDocente/autoevaluacion.jsp">Autoevaluación</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/evaluacionDocente/resultados/resultadosEvaluacionDocentePorDocente.jsp"> Resultados de evaluación docente </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-male" aria-hidden="true"></i> Seguimiento a estudiantes <span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/planaccion/registrarPlanAccion.jsp">Nuevo plan de acción</a>
                            </li>
                            <li>
                                <a href="/SISAASE_war_exploded/jsp/permanencia/planaccion/seguimientoPlanAccion.jsp">Consulta / seguimiento</a>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>




















    </nav>
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="background: #345177; color: white;">
                    <h4 class="modal-title">Roles</h4>
                </div>
                <div class="modal-body">
                    <h4>Selecciona el rol para acceder a las funcionalidades correspondientes.</h4>
                    <div class="row">

                        <div class="col-md-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="row">
                                        <a href="/SISAASE_war_exploded/cambiarSesion?idRolCambiar=profesor&rolCambiar=Docente" style="color: white;">
                                            <div class="col-md-8">Docente</div>
                                            <div class="col-md-4 text-right"><span class="text-right"><i class="fa fa-angle-right"></i></span></div>
                                        </a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <p>Docente.</p>
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

    <div id="page-wrapper">
        <br/>
        <div class="panel panel-primary">
            <div class="panel-heading">Mi perfil</div>
            <div class="panel-body" style="padding-top: 0px;">
                <div ng-show="perfil" >
                    <div class="row">
                        <div class="col-md-16" >
                            <!--<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>-->
                            <div class="fb-profile">
                                <div class="fb-profile-text">
                                    <img align="left" class="fb-image-lg"  src="/SISAASE_war_exploded/img/utez/header-bg.jpg" alt="Profile image example"/>
                                    <img align="left" class="fb-image-profile thumbnail" src="/SISAASE_war_exploded/img/system/photo.jpg" alt="Profile image example"/>
                                    <h3 style="margin-top: 0px;" ><span ng-bind="perfil.nombreProfesor + ' ' + perfil.apPaterno + ' ' + perfil.apMaterno" ></span></h3>
                                    <span><label class="control-label">ID: </label></span> <span ng-bind="perfil.idProfesor"></span>
                                    <span style="margin-left: 0.5em; margin-right: 0.5em;"></span>
                                    <span><label class="control-label">Usuario: </label></span> <span>JAZMINROGEL</span>
                                    <span style="margin-left: 0.5em; margin-right: 0.5em;"></span>
                                    <span><label class="control-label">Puesto: </label></span> <span ng-bind="perfil.tipoProfesor" ></span>
                                    <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#modalAyudaPerfilProfesor" style="margin-bottom: 0.1em; margin-right: 1.2em;"> ? </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form role="form" name="form1" ng-show="mostrarPanelDatosProfesor" novalidate >
                        <div class="row">
                            <div class="col-md-12" >
                                <div class="panel panel-default">
                                    <div class="panel-heading">Información Académica / Personal</div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.nombre.$valid || form1.nombre.$valid && form1.$dirty, 'has-error': form1.nombre.$invalid && form1.nombre.$dirty || form1.nombre.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="nombre">Nombre: </label>
                                                    <input type="text" class="form-control" id="nombre" name="nombre" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñüÜ ]{3,50}$/" ng-model="perfil.nombreProfesor" maxlength="50" required />
                                                </div>
                                            </div>
                                            <div class="col-md-4" >
                                                <div class="form-group" ng-class="{'has-success': form1.apPaterno.$valid || form1.apPaterno.$valid && form1.$dirty, 'has-error': form1.apPaterno.$invalid && form1.apPaterno.$dirty || form1.apPaterno.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="apPaterno">Primer apellido: </label>
                                                    <input type="text" class="form-control" id="apPaterno" name="apPaterno" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñüÜ ]{3,40}$/" ng-model="perfil.apPaterno" maxlength="40" required />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.apMaterno.$valid || form1.apMaterno.$valid && form1.$dirty, 'has-error': form1.apMaterno.$invalid && form1.apMaterno.$dirty || form1.apMaterno.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="apMaterno">Segundo apellido: </label>
                                                    <input type="text" class="form-control" id="apMaterno" name="apMaterno" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñüÜ ]{3,40}$/" ng-model="perfil.apMaterno" maxlength="40" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.correoIns.$valid || form1.correoIns.$valid && form1.$dirty, 'has-error': form1.correoIns.$invalid && form1.correoIns.$dirty || form1.correoIns.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="correoIns">Correo institucional: </label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" id="correoIns" name="correoIns" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñüÜ]{3,50}$/" ng-model="perfil.emailInstitucional" maxlength="50" required />
                                                        <div class="input-group-addon">@utez.edu.mx</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.correoAlt.$valid || form1.correoAlt.$valid && form1.$dirty, 'has-error': form1.correoAlt.$invalid && form1.correoAlt.$dirty || form1.correoAlt.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="correoAlt">Correo personal: </label>
                                                    <input type="text" class="form-control" id="correoAlt" name="correoAlt" ng-pattern="/^[a-zA-Z0-9._]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/" ng-model="perfil.emailParticular" maxlength="40" required />
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.ext.$valid || form1.ext.$valid && form1.$dirty, 'has-error': form1.ext.$invalid && form1.ext.$dirty || form1.ext.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="ext">Extensión: </label>
                                                    <input type="text" class="form-control" id="ext" name="ext" ng-model="perfil.telefonoProfesor" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñüÜ0-9. ]{1,40}$/" maxlength="40" required/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.nivelMaxEst.$valid || form1.nivelMaxEst.$valid && form1.$dirty, 'has-error': form1.nivelMaxEst.$invalid && form1.nivelMaxEst.$dirty || form1.nivelMaxEst.$invalid && form1.$dirty}">
                                                    <label class="control-label" data-toggle="tooltip" title="Ejemplo: I.T.I. , M.A. Este dato será usado en formatos de estadía." for="nivelMaxEst">Siglas nivel máximo de estudios: </label>
                                                    <input type="text" class="form-control" id="nivelMaxEst" name="nivelMaxEst" ng-pattern="/^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ0-9. ]{2,50}$/" ng-model="perfil.nivelMaximoEstudios" maxlength="50" required />
                                                </div>
                                            </div>
                                            <div class="col-md-8">
                                                <div class="form-group" ng-class="{'has-success': form1.titulo.$valid || form1.titulo.$valid && form1.$dirty, 'has-error': form1.titulo.$invalid && form1.titulo.$dirty || form1.titulo.$invalid && form1.$dirty}">
                                                    <label class="control-label" data-toggle="tooltip" title="Este dato será usado en formatos de estadía." for="titulo">Título: </label>
                                                    <input type="text" class="form-control" id="titulo" name="titulo" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÑñüÜ0-9. ]{3,100}$/" ng-model="perfil.tituloProfesor" maxlength="100" required />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group" ng-class="{'has-success': form1.curp.$valid || form1.curp.$valid && form1.$dirty, 'has-error': form1.curp.$invalid && form1.curp.$dirty || form1.curp.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="curp">CURP: </label>
                                                    <input type="text" class="form-control" id="curp" name="curp" ng-pattern="/^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ0-9. ]{18,18}$/" ng-model="perfil.curpProfesor" minlength="18" maxlength="18" required />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group" ng-class="{'has-success': form1.semblanza.$valid || form1.semblanza.$valid && form1.$dirty, 'has-error': form1.semblanza.$invalid && form1.semblanza.$dirty || form1.semblanza.$invalid && form1.$dirty}">
                                                    <label class="control-label" for="semblanza">Semblanza: </label>
                                                    <textarea class="form-control" id="semblanza" name="semblanza" ng-pattern="/^[A-Za-záéíóúÁÉÍÓÚÂÊÎÔÛâêîôûàèìòùÀÈÌÒÙÑñüÜ0-9\n\.\,\;\_#$\%\&\/\(\)\¿\?\¡\!\|\°\+\-\*\=\[\]\{\}\<\>\:\&quot\^\'\ ]{3,5000}$/" ng-model="perfil.semblanza" maxlength="5000" style="resize: vertical; height: 200px;" required ></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3" >
                                                <span class="label label-info" >Caracteres: {{(perfil.semblanza+"").length}} / 5000</span>
                                            </div>
                                            <div class="col-md-2 col-md-offset-7 text-center" >
                                                <button class="btn btn-success" ng-click="guardarInformacionProfesor()" ng-disabled="form1.$pristine || !form1.$valid" >Actualizar</button>
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
                                            <div class="form-group col-md-4" ng-class="{'has-success': form2.nuevaContrasexa.$valid, 'has-error': form2.nuevaContrasexa.$invalid && form2.nuevaContrasexa.$dirty}">
                                                <label class="control-label" for="nuevaContrasexa">Nueva contraseña:   </label>
                                                <input type="password" class="form-control" name="nuevaContrasexa" id="nuevaContrasexa" ng-pattern="/^((?=.*\d)(?=.*[A-Za-z]).{8,30})$/" ng-model="usuario.nuevaContrasexa" minlength="8" maxlength="30" required />
                                                <div ng-show="(form2.nuevaContrasexa.$dirty && form2.nuevaContrasexa.$invalid)" class="alert alert-warning">
                                                    La nueva contraseña no cumple con el formato requerido, tamaño minimo de 8 y al menos 1 numero.<strong class="alert-link"> Ejemplo: abcdef123</strong>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" ng-class="{'has-success':form2.confirmaContrasexa.$valid, 'has-error': form2.confirmaContrasexa.$invalid && form2.confirmaContrasexa.$dirty}">
                                                <label class="control-label" for="confirmaContrasexa">Confirmar contraseña:   </label>
                                                <input type="password" class="form-control" name="confirmaContrasexa" id="confirmaContrasexa" ng-pattern="/^((?=.*\d)(?=.*[A-Za-z]).{8,30})$/" ng-model="usuario.confirmaContrasexa" minlength="8" maxlength="30" required />
                                                <div ng-show="form2.confirmaContrasexa.$dirty && (usuario.nuevaContrasexa !== usuario.confirmaContrasexa)" class="alert alert-warning">
                                                    <strong class="alert-link">Confirmación incorrecta</strong>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" ng-class="{'has-success': form2.contrasexa.$valid, 'has-error': form2.contrasexa.$invalid && form2.contrasexa.$dirty}">
                                                <label class="control-label" for="contrasexa">Contraseña actual:   </label>
                                                <input type="password" class="form-control" name="contrasexa" id="contrasexa" ng-model="usuario.contrasexa" maxlength="30" required />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-2 col-md-offset-10 text-center">
                                                <button  class="btn btn-success" ng-disabled="!form2.$valid || (usuario.nuevaContrasexa !== usuario.confirmaContrasexa)" ng-click="modificarContrasexa()" >Modificar</button>
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

<div class="modal fade" id="modalAyudaPerfilProfesor" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="background: #3C8DBC; color: white;">
                <h4 class="modal-title" id="myModalLabel">Ayuda para el Perfil de Docente</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-info">
                    <strong>¡Importante!</strong>
                    <p>La siguiente información proporciona ayuda para saber registrar y actualizar los datos mostrados en el perfil de docente.</p>
                </div>
                <h3>Ejemplo de un perfil: </h3>
                <img width="100%" src="/SISAASE_war_exploded/img/system/Ejemplo_Perfil_Profesor.png"/>
                <br>
                <table class="table table-striped table-bordered table-hover dataTable" role="grid">
                    <thead>
                    <th>Indicador</th>
                    <th>Descripción</th>
                    </thead>
                    <tbody>
                    <tr >
                        <td style="text-align: center"><p>1</p></td>
                        <td><p>Nombre: Permite como máximo 50 caracteres alfabéticos (letras).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>2</p></td>
                        <td><p>Primer apellido: Permite como máximo 40 caracteres alfabéticos (letras).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>3</p></td>
                        <td><p>Segundo apellido: Permite como máximo 40 caracteres alfabéticos (letras).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>4</p></td>
                        <td><p>Correo institucional: Permite como máximo 40 caracteres alfabéticos (letras).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>5</p></td>
                        <td><p>Correo personal: Requiere el formato de email estandar (ejemplo@ejemplo.com), además de permitir como máximo 50 caracteres alfanuméricos (letras y números).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>6</p></td>
                        <td><p>Extensión: Permite como máximo 40 caracteres alfanuméricos (letras y números).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>7</p></td>
                        <td><p>Título: Permite como máximo 100 caracteres alfanuméricos (letras y números).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>8</p></td>
                        <td><p>Nivel máximo de estudios: Permite como máximo 50 caracteres alfanuméricos (letras y números).</p></td>
                    </tr>
                    <tr>
                        <td style="text-align: center"><p>9</p></td>
                        <td><p>Semblanza: Permite como máximo 2000 caracteres alfanuméricos (letras y números).</p></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
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
<script src="/SISAASE_war_exploded/js/control/permanencia/perfil/ajsControlPerfil.js"></script>
</body>
</html>