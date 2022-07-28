var sisa = angular.module("sisa", ['ui.bootstrap', 'oitozero.ngSweetAlert']);

sisa.controller("ControlAsesorias", ['$rootScope', '$scope', '$http', 'SweetAlert', function ($rootScope, $scope, $http, SweetAlert) {
    $scope.abrirModalFinalizar = () =>{
        $('#modalFinalizar').modal('show')
    }
    $scope.cerrarModalFinalizar = () =>{
        $('#modalFinalizar').modal('hide')
        $scope.asesoriaImpartida = null;
        $scope.dudas = null;
        $scope.formValid = false;
    }

    $scope.abrirModalCancelar = () =>{
        $('#modalCancelar').modal('show')
    }
    $scope.cerrarModalCancelar = () =>{
        $('#modalCancelar').modal('hide')
        $scope.motivo = ""
    }

    $scope.abrirModalInformacion = () =>{
        $('#modalInformacion').modal('show')
    }
    $scope.cerrarModalInformacion = () =>{
        $('#modalInformacion').modal('hide')
    }

    $scope.abrirModalSolicitar = () =>{
        $('#modalSolicitar').modal('show')
    }

    $scope.cerrarModalSolicitar = () =>{
        $('#modalSolicitar').modal('hide')
    }


    $scope.asesoriaImpartida = null;
    $scope.dudas = null;
    $scope.formValid = false;
    $scope.checkOptions = ()=>{
        if($scope.asesoriaImpartida == null){
            $scope.formValid = false
        }else if($scope.asesoriaImpartida == 1 && $scope.dudas == null){
            $scope.formValid = false
        }else if($scope.asesoriaImpartida != null && $scope.dudas!=null){
            $scope.formValid = true
        }else if($scope.asesoriaImpartida == 2){
            $scope.formValid = true
            $scope.dudas = null
        }else{
            $scope.formValid = true
        }
    }

    $scope.consultarHorarios = function (){
        $http({
            method: 'POST',
            url: '/SISAASE_war_exploded/consultarHorarios'
        }).success(function (data) {
            $scope.horarios = data;
            console.log(data)
        }).error($rootScope.errorhttp);
    }

    $scope.finalizarAsesoria = function () {
        SweetAlert.swal({
            title: "¿Estás seguro de finalizar la asesoría?",
            text: "La asesoría solo deberá ser finalizada en caso de que la asesoría ya haya sido impartida o el docente no haya asistido",
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
                $scope.asesoriaImpartida = null;
                $scope.dudas = null;
                $scope.formValid = false;
                $('#modalFinalizar').modal('hide')
                SweetAlert.swal({timer: 3000, type: "success", title: "Asesoría finalizada correctamente."});

            }

        });



    };
    $scope.cancelarAsesoria = function () {
        SweetAlert.swal({
            title: "¿Estás seguro de cancelar la asesoría?",
            text: "La asesoría será cancelada y será notificado a tu docente",
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
                $scope.motivo = ""
                $('#modalCancelar').modal('hide')
                SweetAlert.swal({timer: 3000, type: "success", title: "Asesoría cancelada correctamente."});

            }

        });
    }
}]);
