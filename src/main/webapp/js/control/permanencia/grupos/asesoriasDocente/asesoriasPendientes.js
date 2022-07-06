var sisa = angular.module("sisa", ['ui.bootstrap', 'oitozero.ngSweetAlert']);

sisa.controller("ControlAsesoriasDocente", ['$rootScope', '$scope', '$http', 'SweetAlert', function ($rootScope, $scope, $http, SweetAlert) {
        $scope.modalAceptarR = () =>{
                $('#aceptarRechazar').modal('show')
        }

        $scope.modalCancelar = () => {

                $('#cancelar').modal('show')
                $("#motCancelacion").val("");
        }

        $scope.modalFinalizar = () => {
                $('#finalizar').modal('show')
        }

        $scope.cerrarModalAceptarR = () => {
                $('#aceptarRechazar').modal('hide')
        }

        $scope.cerrarModalCancelar = () => {
                $('#cancelar').modal('hide')
        }

        $scope.cerrarModalFinalizar = () => {
                $('#finalizar').modal('hide')
        }


        }]);