const sisa = angular.module("sisa", ['smart-table', 'oitozero.ngSweetAlert']);

sisa.controller("historialDocente", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    //
    // $scope.showMotivosRechazo = true;
    // $scope.showMotivosCancelacion = true;
    //
    // $scope.showMotivos = (estado) => {
    //     estado.equals('Cancelada') ? $scope.showMotivosCancelacion = true : $scope.showMotivosCancelacion = false;
    //     estado.equals('Rechazada') ? $scope.showMotivosRechazo = true : $scope.showMotivosRechazo = false;
    // }


    $scope.rowCollection = [
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '01/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Carlos Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
        {fecha: '24/02/2022', matricula: '20203TN12', alumno: 'Tania Ricardo Espinoza Pliego', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada'},
    ];

    $scope.predicates = ['fecha', 'matricula', 'alumno', 'asignatura', 'tema', 'estado'];
    $scope.selectedPredicate = $scope.predicates[0];
}]);