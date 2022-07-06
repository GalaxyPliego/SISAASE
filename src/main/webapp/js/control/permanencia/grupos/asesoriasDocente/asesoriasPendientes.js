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
                $scope.aceptarRechazar = null
                var discount_percentage = document.getElementById("motivosRechazo")
                discount_percentage.hidden = true;
                var aceptarR = document.getElementById('aceptarR');
                var rechazarR= document.getElementById('rechazarR');
                var rechaz0= document.getElementById('rechaz0');
                rechaz0.value = null;
                rechazarR.classList.remove("btn");
                aceptarR.classList.add("btn");
                rechazarR.hidden = true;
                aceptarR.hidden = false;

        }

        $scope.cerrarModalCancelar = () => {
                $('#cancelar').modal('hide')
        }

        $scope.cerrarModalFinalizar = () => {
                $('#finalizar').modal('hide')
                $scope.asesoriaImpartida = null
                var discount_percentages = document.getElementById('duracion')
                discount_percentages.hidden = true;
                var duracionMinutos = document.getElementById('duracionMin')
                duracionMinutos.value = null


        }


        }]);