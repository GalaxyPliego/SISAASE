<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String context = request.getContextPath();%>




<!DOCTYPE html>
<html lang="es" id="ng-app" ng-app="sisa">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SISA</title>
    <link rel="icon" href="/SISAASE_war_exploded/img/utez/favicon.ico" />
    <!-- Bootstrap Core CSS -->
    <link href="/SISAASE_war_exploded/components/bootstrap/dist/css/bootstrap_1.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/SISAASE_war_exploded/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/SISAASE_war_exploded/components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="/SISAASE_war_exploded/css/sweetalert.css" />
    <link rel="icon" href="/SISAASE_war_exploded/img/utez/favicon.ico" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        /* Sticky footer styles-------------------------------------------------- */
        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            /* Set the fixed height of the footer here */
            height: 60px;
            /*background-color: #f5f5f5;*/
        }
        @media only screen and (max-width: 600px) {
            .footer {
                position: relative;
                bottom: 0;
                width: 100%;
                height:60px;
            }
        }
        @media only screen and (max-height: 600px) and (max-height: 600px){
            .footer {
                position: relative;
                bottom: 0;
                width: 100%;
                height:60px;
            }
        }
        /* Custom page CSS-------------------------------------------------- */
        /* Not required for template or sticky footer method. */
        .container .text-muted {
            margin: 20px 0;
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

<body ng-controller="ControlLogin">
<!--[if lte IE 8]><div class="hidden" >  <![endif]-->
<div class="se-pre-con"></div>
<!--[if lte IE 8]></div>  <![endif]-->

<!--[if lte IE 8]><div class="hidden" >  <![endif]-->
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="row">
                <div class="col-md-11 text-center">
                    <img src="/SISAASE_war_exploded/img/utez/logo2016-contorno.png" style="width: 50%;"/>
                </div>
            </div>
            <br/>
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        Inicio de sesión
                    </h3>
                </div>
                <div class="panel-body">

                    <form ng-submit="iniciarSesion()" role="form" method="post" name="formLogin" action="/SISAASE_war_exploded/iniciarSesion" ng-submit="formLogin.$valid" >
                        <fieldset>
                            <div class="form-group">
                                <input class="form-control" ng-model="beanUsuario.usuario" placeholder="Tu usuario" name="beanUsuario.usuario" type="text" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" ng-model="beanUsuario.contrasena" placeholder="Tu contraseña" name="beanUsuario.contrasena" type="password"  maxlength="30" value="" required>
                            </div>
                            <div>
                                <label>
                                    <a href="/SISAASE_war_exploded/jsp/recuperarContrasexa.jsp">¿Olvidaste tu contraseña?</a>
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button ng-bind="txtBtnIniciar" ng-show="btnIniciar" ng-disabled="formLogin.$pristine || !formLogin.$valid" class="btn btn-lg btn-success btn-block"></button>
                            <a ng-bind="txtBtnIniciar"  ng-show="!btnIniciar" ng-disabled="btnIniciar" href="#" class="btn btn-lg btn-success btn-block"></a>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
<!--[if lte IE 8]></div>  <![endif]-->


<!--[if lte IE 8]>
<div class="row">
    <div class="col-md-8 col-md-offset-2 text-center">
        <h3 class="text-danger">Actualiza tu navegador.</h3>
        <h4  class="text-warning">La versión de tu navegador es obsoleta. </h4>
        <h3  class="text-warning">Sugerencias: </h3>
        <ul class="text-warning">
            <li>Actualiza tu navegador.</li>
            <li>Usa Google Chrome.</li>
            <li>Usa Mozilla Firefox.</li>
        </ul>
        <br/>
        <br/>
        <br/>
        <a href="http://www.utez.edu.mx/"><img width="30%" src="/SISAASE_war_exploded/img/utez/logo-utez.png" /> </a>
    </div>
</div>
<![endif]-->




<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <!--[if lte IE 8]><div class="hidden" >  <![endif]-->
                <!--<a ng-click="redireccionSISE()" style="cursor: pointer; font-size: 15pt;"><span class="label label-primary">SISA | Docentes y administrativos</span></a>-->
                <!--[if lte IE 8]></div>  <![endif]-->

                <!--[if lte IE 8]>
                <a href="http://sise.utez.edu.mx:8080/SISE/"><h4  style="cursor: pointer;"><span class="label label-primary">SISA | Docentes y administrativos</span></h4> </a>
                <![endif]-->
                <a href="/SISAASE_war_exploded/version.jsp" style="font-size: 15pt;"><span class="label label-primary">Acerca de</span></a>
            </div>
        </div>
    </div>
</footer>


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
<!-- Bootstrap Core JavaScript -->
<script src="/SISAASE_war_exploded/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.6/angular.min.js"></script>-->
<!--<script src="http://docs.angularjs.org/angular.min.js"></script>-->
<script src="/SISAASE_war_exploded/js/angular-1.4.6.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<!--<script src="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.js"></script>-->

<!-- Custom Theme JavaScript -->
<!--<script src="/SISAASE_war_exploded/js/sb-admin-2.js"></script>-->

<script src="/SISAASE_war_exploded/js/control/login/ajsControlLogin.js"></script>

<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>
<!-- Cambio para commit-->
</body>

</html>
