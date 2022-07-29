/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var sisa = angular.module("sisa", ['ui.bootstrap', 'oitozero.ngSweetAlert']);


sisa.controller("ControlPerfil", ['$rootScope', '$scope', '$http', 'SweetAlert', function ($rootScope, $scope, $http, SweetAlert) {

    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    $scope.usuario = '';
    $scope.respuesta = '';
    $scope.perfil = '';
    $scope.contrasenaRestablecida = false;
    $scope.mostrarPanelDatosProfesor = true;
    $scope.estados = [];
    $scope.municipiosNacimiento = [];
    $scope.municipiosRadica = [];
    var form1 = $scope.form1;
    $scope.modDate = '';
    $('[data-toggle="tooltip"]').tooltip();

//        $scope.demo1 = function () {
//            SweetAlert.swal("Here's a message");
//        }

    $scope.consultarPerfil = function () {
        console.log("aaaa")
        $http({method: 'POST', url: '/SISAASE_war_exploded/consultarPerfil'}).success(function (data) {
            $scope.estados = data.estados;
            $scope.municipiosNacimiento = data.municipiosNacimiento;
            $scope.municipiosRadica = data.municipiosRadica;

//                angular.copy($scope.perfil.fechaNacimiento,$scope.modDate);

            $scope.perfil = data.alumno;
            $scope.perfil.apMaterno = $scope.perfil.apMaterno === "." ? "" : $scope.perfil.apMaterno;
            var fechaNacimiento = data.alumno.fechaNac.split("-");
            $scope.modDate = new Date(fechaNacimiento[0], (fechaNacimiento[1] - 1), fechaNacimiento[2]);
            $scope.carreraPerfil = $scope.perfil.idCarrera.nombreCarrera + ' ' + ($scope.perfil.idCarrera.idEspecialidad.descripcion === 'Sin área' && ' ' || '- ' + $scope.perfil.idCarrera.idEspecialidad.descripcion);
            $scope.perfil.genIngreso = `${$scope.perfil.idGeneracion.noGeneracion} ${$scope.perfil.idGeneracion.ingresoMes}-${$scope.perfil.idGeneracion.ingresoAxo} / ${$scope.perfil.idGeneracion.egresoMes}-${$scope.perfil.idGeneracion.egresoAxo}`
            $scope.perfil.genEgreso = `${$scope.perfil.idGeneracion.noGeneracion} ${$scope.perfil.idGeneracion.ingresoMes}-${$scope.perfil.idGeneracion.ingresoAxo} / ${$scope.perfil.idGeneracion.egresoMes}-${$scope.perfil.idGeneracion.egresoAxo}`

        }).error($rootScope.errorhttp);
    };

    $scope.recuperarContrasexa = function () {
        console.log("aaaaaa")
        SweetAlert.swal({
            showCancelButton: true,
            closeOnConfirm: false,
            showLoaderOnConfirm: true,
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar",
            type: "info",
            title: "¿Estás seguro?",
            text: "Se realizará una petición de cambio de contraseña."
        }, function (isConfirm) {
            $scope.usuario.usuario = $scope.email
            if (isConfirm) {
                $http({
                    method: 'POST',
                    url: '/SISAASE_war_exploded/recuperarContrasexa',
                    data: 'data=' + angular.toJson($scope.usuario)
                }).success(function (data) {
                    if (data.respuesta === "ok") {
                        SweetAlert.swal({
                            title: "Recuperación existosa",
                            text: "En breve recibirás un correo para restablecer tu contraseña.",
                            type: "info"
                        });
                        $scope.email = '';
                        setTimeout(function () {
                            window.location.replace("/SISAASE_war_exploded");
                        }, 6000);
                    } else if (data.respuesta === "error") {
                        SweetAlert.swal({
                            timer: 6000,
                            type: "error",
                            title: "Usuario inválido.",
                            text: " No existe un usuario con este correo electrónico, por favor solicita ayuda a soporte técnico."
                        });
                    }
                }).error($rootScope.errorhttp);
            }
        });
    };

    $scope.guardarInformacion = function () {
        SweetAlert.swal({
            title: "¿Estas seguro?",
            text: "Tus datos deben ser correctos ya que serán usados en la elaboración de tus documentos oficiales.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false,
            closeOnCancel: true,
            showLoaderOnConfirm: true

        }, function (isConfirm) {
            if (isConfirm) {

                $scope.perfil.aMaterno = $scope.perfil.aMaterno === "" ? "." : $scope.perfil.aMaterno;
                var alumno = angular.toJson($scope.perfil);
                $http({
                    method: 'POST',
                    url: '/SISAASE_war_exploded/modificarPerfilAlumno',
                    data: 'data=' + alumno
                }).success(function (data) {
                    if (data.respuesta === "ok") {
                        $scope.perfil.aMaterno = $scope.perfil.apMaterno === "." ? "" : $scope.perfil.aMaterno;
                        SweetAlert.swal({timer: 3000, type: "success", title: "Perfil actualizado correctamente."});
                    } else {
                        SweetAlert.swal({
                            timer: 2000,
                            type: "error",
                            title: "Perfil no actualizado.",
                            text: "Algo salió mal al intentar modificar tus datos."
                        });
                    }
//                        angular.copy($scope.modDate,$scope.perfil.fechaNacimiento);

                }).error($rootScope.errorhttp);
            }
        });


    }
    $scope.modificarContrasexa = function () {
        SweetAlert.swal({
            title: "¿Estás seguro?",
            text: "Tu nuevo acceso será con la nueva contraseña, no la olvides.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false,
            closeOnCancel: true,
            showLoaderOnConfirm: true

        }, function (isConfirm) {
            if (isConfirm) {
                $scope.usuario.usuario = $scope.usuario.nuevaContrasexa.replace(/#|%/g, "%25");
                $scope.usuario.usuario = $scope.usuario.nuevaContrasexa.replace(/#|&/g, "%26");
                $scope.usuario.confirmaContrasexa = $scope.usuario.confirmaContrasexa.replace(/#|%/g, "%25");
                $scope.usuario.confirmaContrasexa = $scope.usuario.confirmaContrasexa.replace(/#|&/g, "%26");
                $scope.usuario.contrasena = $scope.usuario.contrasexa.replace(/#|%/g, "%25");
                $scope.usuario.contrasena = $scope.usuario.contrasexa.replace(/#|&/g, "%26");
                var usuario = angular.toJson($scope.usuario);
                $http({
                    method: 'POST',
                    url: '/SISAASE_war_exploded/modificarContrasexa',
                    data: 'data=' + usuario
                }).success(function (data) {
                    console.log(data)
                    if (data.respuesta === "ok") {
                        SweetAlert.swal({
                            showCancelButton: false,
                            closeOnConfirm: false,
                            showConfirmButton: false,
                            allowEscapeKey: false,
                            type: "success",
                            title: "Contraseña actualizada correctamente.",
                            text: "La sesión será cerrada por seguridad."
                        });
                        setTimeout(function () {
                            window.location.replace("/SISAASE_war_exploded/cerrarSesion");
                        }, 4000);

                    } else {
                        SweetAlert.swal({
                            timer: 2000,
                            type: "error",
                            title: "Contraseña no actualizada.",
                            text: "Algo salió mal al intentar modificar tus datos."
                        });
                    }

                }).error($rootScope.errorhttp);
            }
        });
    }
    $scope.recuperarContrasexaProfesor = function () {

        SweetAlert.swal(
            {
                showCancelButton: true,
                closeOnConfirm: false,
                showLoaderOnConfirm: true,
                confirmButtonText: "Aceptar",
                cancelButtonText: "Cancelar",
                type: "info",
                title: "¿Estás seguro?",
                text: "Tu contraseña será cambiada."
            }, function (isConfirm) {
                if (isConfirm) {
                    var parametros = $scope.correoInst;
                    $http({
                        method: 'POST',
                        url: '/SISAVA/recuperarContrasexaProfesor',
                        data: 'parametros=' + parametros
                    }).success(function (data) {
                        console.log(data);
                        if (data.respuesta === "correo_enviado") {
                            SweetAlert.swal({
                                title: "Recuperación existosa",
                                text: "En breve recibirás un correo con tu nueva contraseña.",
                                type: "info"
                            });
                            $scope.correoInst = '';
                            setTimeout(function () {
                                window.location.replace("/SISAVA");
                            }, 3000);
                        } else if (data.respuesta === "correo_no_enviado") {
                            SweetAlert.swal({
                                timer: 2000,
                                type: "error",
                                title: "Correo no enviado.",
                                text: "Algo salio mal al intentar recuperar tu contraseña, intentalo de nuevo."
                            });
                        } else if (data.respuesta === "usuario_no_encontrado") {
                            SweetAlert.swal({
                                timer: 2000,
                                type: "error",
                                title: "Usuario no encontrado.",
                                text: "Los datos ingresados no corresponden a ningun usuario registrado."
                            });
                        } else if (data.respuesta === "alumno_no_encontrado") {
                            SweetAlert.swal({
                                timer: 2000,
                                type: "error",
                                title: "Alumno no inscrito.",
                                text: "Para poder realizar tu cambio de contraseña debes ser un alumno inscrito."
                            });
                        } else {
                            SweetAlert.swal({
                                timer: 2000,
                                type: "error",
                                title: "Oups... algo salio mal .",
                                text: "Intentalo nuevamente."
                            });
                        }

                    }).error($rootScope.errorhttp);
                }
            });
    }
    /* CALENDARION DETEPICKER*/

    $scope.open = function ($event) {
        $scope.status.opened = true;
    };
    $scope.dateOptions = {
        formatYear: 'yy',
        startingDay: 1
    };
    $scope.format = 'dd/MM/yyyy';
    $scope.status = {
        opened: false
    };
    /* CALENDARION DETEPICKER*/


    $rootScope.errorhttp = function (data, status, headers, config) {
        switch (Number(status)) {
            case 401:
                SweetAlert.swal({
                    title: "Sesión expirada",
                    text: "Por tu seguridad tu sesión ha sido cerrada.",
                    type: "error",
                    timer: 5000,
                    allowEscapeKey: false,
                    showCancelButton: false,
                    showConfirmButton: false
                });
                setTimeout(function () {
                    window.location.replace("/SISAASE_war_exploded");
                }, 5000);
                break;
            case 403:
                SweetAlert.swal({
                    title: "Acceso denegado",
                    text: "Lamentablemente no cuentas con los permisos necesarios para realizar esta acción.",
                    type: "error",
                    timer: 3000
                });
                break;
            case 500:
                SweetAlert.swal({
                    title: "Error interno",
                    text: "Un error interno ocurrió dentro del sistema.",
                    type: "error",
                    timer: 3000
                });
                break;
            default:
                console.log("Ocurrió un problema.");
        }
    };

    $scope.consultarPerfilProfesor = function () {
        $http({method: 'POST', url: '/SISAASE_war_exploded/consultarPerfilProfesor'}).success(function (data) {
            $scope.perfil = data.profesor;
        }).error($rootScope.errorhttp);
    };

    $scope.guardarInformacionProfesor = function () {


        SweetAlert.swal({
            title: "¿Estás seguro?",
            text: "Tus datos deben ser correctos ya que serán usados en la elaboración de documentos oficiales.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar",
            closeOnConfirm: false,
            closeOnCancel: true,
            showLoaderOnConfirm: true

        }, function (isConfirm) {
            if (isConfirm) {
                $scope.perfil.semblanza = $scope.perfil.semblanza.replace(/#|%/g, "%25");
                $scope.perfil.semblanza = $scope.perfil.semblanza.replace(/#|&/g, "%26");
                $scope.usuario = $scope.perfil
                let profesor = angular.toJson($scope.usuario);
                $http({
                    method: 'POST',
                    url: '/SISAASE_war_exploded/modificarPerfilProfesor',
                    data: 'data=' + profesor
                }).success(function (data) {
                    if (data.respuesta === "ok") {
                        SweetAlert.swal({timer: 3000, type: "success", title: "Perfil actualizado correctamente."});
                    } else {
                        SweetAlert.swal({
                            timer: 2000,
                            type: "error",
                            title: "Perfil no actualizado.",
                            text: "Algo salió mal al intentar modificar tus datos."
                        });
                    }
                }).error($rootScope.errorhttp);
            }
            $scope.perfil.semblanza = $scope.perfil.semblanza.replace(/#|%25/g, "%");
            $scope.perfil.semblanza = $scope.perfil.semblanza.replace(/#|%26/g, "&");
        });
    };

}]);
