const sisa = angular.module("sisa", ['smart-table', 'oitozero.ngSweetAlert']);

/* ==> COORDINADOR <== */
sisa.controller("resumenHistorial", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayPeriodoCuatrimestral = [];
    $scope.findPeriodoCuatrimestral = () => {
        console.log("Entro al findPeriodoCuatrimestral")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/findPeriodoCuatrimestral'
        }).then(function(response){
            console.log(response)
            const {data: {listPeriodoCuatrimestral}} = response
            $scope.arrayPeriodoCuatrimestral = listPeriodoCuatrimestral
            console.log($scope.arrayPeriodoCuatrimestral)
        })
    }

}]);

sisa.controller("historialDetallado", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayPeriodoCuatrimestral = [];
    $scope.findPeriodoCuatrimestral = () => {
        console.log("Entro al findPeriodoCuatrimestral")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/findPeriodoCuatrimestral'
        }).then(function(response){
            console.log(response)
            const {data: {listPeriodoCuatrimestral}} = response
            $scope.arrayPeriodoCuatrimestral = listPeriodoCuatrimestral
            console.log($scope.arrayPeriodoCuatrimestral)
        })
    }

    $scope.arrayHistorialDetallado = [];

    $scope.arrayPeriodoCuatrimestral = [];
    $scope.findHistorialDetallado = () => {
        console.log("Entro al findHistorialDetallado")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/findHistorialDetallado'
        }).then(function(response){
            console.log(response)
            const {data: {listHistorialDetallado}} = response
            $scope.arrayHistorialDetallado = listHistorialDetallado
            console.log($scope.arrayHistorialDetallado)
        })
    }
    $scope.predicates = ['matricula', 'nombre', 'sexo', 'carrera', 'grado', 'grupo', 'noAsesorias'];
    $scope.selectedPredicate = $scope.predicates[0];

}]);

