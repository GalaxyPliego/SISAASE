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

sisa.controller("historialGeneral", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
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

    $scope.arrayCarreras = [];
    $scope.findCarreras = () => {
        console.log("Entro al findCarreras")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/findCarreras'
        }).then(function(response){
            console.log(response)
            const {data: {listCarrera}} = response
            $scope.arrayCarreras = listCarrera
            console.log($scope.arrayCarreras)
        })
    }

    $scope.arrayHistorialGeneral = [];
    $scope.findHistorialGeneral = () => {
        console.log("Entro al findHistorialGeneral")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/findHistorialGeneral'
        }).then(function(response){
            console.log(response)
            const {data: {listHistorialGeneral}} = response
            $scope.arrayHistorialGeneral = listHistorialGeneral
            console.log($scope.arrayHistorialGeneral)
        })
    }
    $scope.predicates = ['matricula', 'alumno', 'sexo', 'cautrimestre', 'grupo', 'riesgo', 'fecha', 'docente', 'asignatura', 'estado'];
    $scope.selectedPredicate = $scope.predicates[0];


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

/* ==> ALUMNO <== */
sisa.controller("controllerHistorialAlumno", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    console.log("Entro al historialAlumno")

    $scope.arrayHistorialAlumno = [];
    $scope.findHistorialAlumno = () => {
        console.log("Entro al findHistorialAlumno")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/historial'
        }).then(function(response){
            console.log(response)
            const {data: {listHistorialAlumno}} = response
            $scope.arrayHistorialAlumno = listHistorialAlumno
            console.log($scope.arrayHistorialAlumno)
        })
    }

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

/* ==> ALUMNO <== */
sisa.controller("historialDocente", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    console.log("Entro al historialDocente")

    $scope.arrayHistorialDocente = [];
    $scope.findHistorialDocente = () => {
        console.log("Entro al findHistorialDocente")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/SISAASE_war_exploded/historialDocente'
        }).then(function(response){
            console.log(response)
            console.log(response.data)
            const {data: {listHistorialDocente}} = response
            $scope.arrayHistorialDocente = listHistorialDocente
            console.log('historial docente' + "->" + $scope.arrayHistorialDocente)
        })
    }

    $scope.detailHistorialModal = (historial) =>{
        $scope.detailHistorialDocente = angular.copy(historial)
        $('#modalDetails').modal('toggle')
    }

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

