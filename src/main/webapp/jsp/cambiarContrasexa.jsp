<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en" id="ng-app" ng-app="sisa" >
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

    <link href="/SISAASE_war_exploded/css/general.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/SISAASE_war_exploded/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/SISAASE_war_exploded/components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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

<body ng-controller="ControlLogin" >
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
            <a class="navbar-brand" href="/SISAASE_war_exploded" style="color: #FFF !important;" >Sistema Integral de Servicios Académicos | SISAASE_war_exploded</a>
        </div>
        <!-- /.navbar-header -->

        <ul id="rightMenu" class="nav navbar-top-links navbar-right">


        </ul>


    </nav>

    <br/>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="panel panel-default">
                    <div class="panel-heading">Nueva contraseña</div>
                    <div class="panel-body">
                        <form name="form2">
                            <div class="row">
                                <div class="form-group col-md-12"
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
                                <div class="form-group col-md-12"
                                     ng-class="{'has-success':form2.confirmaContrasexa.$valid, 'has-error': form2.confirmaContrasexa.$invalid && form2.confirmaContrasexa.$dirty}">
                                    <label class="control-label" for="confirmaContrasexa">Confirmar
                                        contraseña: </label>
                                    <input type="password" class="form-control" name="confirmaContrasexa"
                                           id="confirmaContrasexa"
                                           ng-pattern="/^((?=.*\d)(?=.*[A-Za-z]).{8,30})$/"
                                           ng-model="usuario.contrasena" maxlength="30" required/>
                                    <div ng-show="form2.confirmaContrasexa.$dirty && (usuario.nuevaContrasexa !== usuario.contrasena)"
                                         class="alert alert-warning">
                                        <strong class="alert-link">Confirmación incorrecta</strong>
                                    </div>
                                </div>
                                <div class="form-group text-right col-md-12"  >
                                    <input type="submit" class="btn btn-warning" ng-click="contrasexaRecuperada()" ng-disabled="form2.$invalid" value="Cambiar contraseña"/>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /#page-wrapper -->


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

<!-- Metis Menu Plugin JavaScript -->
<script src="/SISAASE_war_exploded/components/metisMenu/dist/metisMenu.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/SISAASE_war_exploded/js/sb-admin-2.js"></script>

<!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.6/angular.min.js"></script>-->
<script src="/SISAASE_war_exploded/js/angular-1.4.6.min.js"></script>

<script src="/SISAASE_war_exploded/js/control/login/ajsControlLogin.js"></script>

<script src="/SISAASE_war_exploded/js/sweetalert.min_1.js"></script>
<script src="/SISAASE_war_exploded/js/SweetAlert.min.js"></script>
<script src="/SISAASE_war_exploded/js/angular-locale_es-mx.js"></script>


</body>

</html>