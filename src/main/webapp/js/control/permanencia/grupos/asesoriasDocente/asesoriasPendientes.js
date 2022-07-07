var sisa = angular.module("sisa", ['smart-table','ui.bootstrap', 'oitozero.ngSweetAlert']);

sisa.controller("ControlAsesoriasDocente", ['$rootScope', '$scope', '$http', 'SweetAlert', function ($rootScope, $scope, $http, SweetAlert) {
        $scope.modalAceptarR = () =>{
                $('#aceptarRechazar').modal('show')
        }

        $scope.modalCancelar = () => {

                $('#cancelar').modal('show')
                $("#motCancelacion").val("");
                var motivosCancel = document.getElementById("motCancelacion")
                motivosCancel.value = null;
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

        $scope.rowCollection = [
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Pendiente'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Pendiente' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Pendiente' },
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Pendiente'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Pendiente' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Pendiente' },
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Pendiente'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Pendiente' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Pendiente' },
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Pendiente'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Pendiente' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Pendiente' },
        ]


        $scope.predicates = ['fecha', 'hora', 'nombre', 'tema', 'estado'];
        $scope.selectedPredicate = $scope.predicates[0];


        $scope.rowCollection2 = [
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Aceptada'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Aceptada' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Aceptada' },
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Aceptada'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Aceptada' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Aceptada' },
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Aceptada'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Aceptada' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Aceptada' },
                { fecha: '2021//05//20', hora: '14:00', nombre: 'Nathaly Escalona Ruiz', tema: 'Sentencias SQL', estado:'Aceptada'},
                { fecha: '2021//05//21', hora: '15:00', nombre: 'Ulises Stamatio Ferraez', tema: 'Triggers', estado:'Aceptada' },
                { fecha: '2021//05//22', hora: '13:00', nombre: 'Carlos Ricardo Espinoza', tema: 'Procedmientos almacenados', estado:'Aceptada' },
        ]


        $scope.campos = ['fecha', 'hora', 'nombre', 'tema', 'estado'];
        $scope.selectedCampos = $scope.campos[0];

        }]);