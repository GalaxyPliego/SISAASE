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
    <link href="/SISAASE_war_exploded/css/gestionHistorial/stylesGestionHistorial.css" rel="stylesheet">

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
<body ng-controller="controller" ng-init="consultarHistorialPagos()">




<!-- /#wrapper -->
<!-- jQuery -->
<script src="/SISAVA/components/jquery/dist/jquery.min.js"></script>
<script>
    //paste this code under the head tag or in a separate js file.
    // Wait for window load
    $(window).load(function () {
        // Animate loader off screen
        $(".se-pre-con").fadeOut("slow");
        ;
    });
</script>
<!-- Angular -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>-->
<script src="/SISAVA/js/angular-1.4.6.min.js"></script>
<script src="/SISAVA/js/control/permanencia/seguimiento/pagos/ajsPagosHistorial.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/SISAVA/components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/SISAVA/components/metisMenu/dist/metisMenu.min.js"></script>
<!--         Morris Charts JavaScript
        <script src="/SISAVA/components/raphael/raphael-min.js"></script>
        <script src="/SISAVA/components/morrisjs/morris.min.js"></script>
        <script src="/SISAVA/js/morris-data.js"></script>-->
<!-- Custom Theme JavaScript -->
<script src="/SISAVA/js/sb-admin-2.js"></script>
<script src="/SISAVA/js/sweetalert.min_1.js"></script>
<script src="/SISAVA/js/SweetAlert.min.js"></script>
<script src="/SISAVA/js/smart-table.min.js"></script>
</body>
</html>
