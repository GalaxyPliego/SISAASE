var sisa = angular.module("sisa", ['ui.bootstrap', 'smart-table','oitozero.ngSweetAlert']);

sisa.controller("ControlAsesorias", ['$rootScope', '$scope', '$http', 'SweetAlert', function ($rootScope, $scope, $http, SweetAlert) {

    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

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

    $scope.cambioMateria = function (){
        $scope.materia = $scope.materiaSeleccionada
        console.log($scope.materia)
        $http({
            method: 'POST',
            url: '/SISAASE_war_exploded/consultarHorarios',
            data: 'data=' + angular.toJson($scope.materia)
        }).success(function (data) {
            $scope.horarios = data.profesors;
            console.log(data)
        }).error(function(error){
            console.log(error)
        });
    }

    $scope.consultarMaterias = function (){
        $http({
            method: 'POST',
            url: '/SISAASE_war_exploded/consultarMaterias',
            data: 'data=' + angular.toJson($scope.materia)
        }).success(function (data) {
            $scope.materias = data.materias;
            console.log(data)
        }).error(function(error){
            console.log(error)
        });
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
