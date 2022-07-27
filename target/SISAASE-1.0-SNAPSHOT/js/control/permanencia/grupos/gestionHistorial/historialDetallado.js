const sisa = angular.module("sisa", ['smart-table', 'oitozero.ngSweetAlert']);

sisa.controller("historialDetallado", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.rowCollection = [
        {matricula: '2020etn129', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20203tn12976', nombre: 'Espezanza Salinas', sexo: 'M', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12345', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12934', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12935', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 1},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 2},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 3},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 23},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 0},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 9},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 8},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 6},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 6},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 7},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 6},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 7},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 6},
        {matricula: '2020etn12945', nombre: 'Carlos Ricardo Espinoza Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 7},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20206tn127', nombre: 'Ricardo Pliego', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20205tn128', nombre: 'Carlos Espinoza ', sexo: 'H', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
        {matricula: '20204tn124', nombre: 'Carlos Pliego', sexo: 'h', carrera: 'Ingeniería en Sistemas', grado: '4', grupo: 'D', noAsesorias: 5},
    ];

    $scope.predicates = ['matricula', 'nombre', 'sexo', 'carrera', 'grado', 'grupo', 'noAsesorias'];
    $scope.selectedPredicate = $scope.predicates[0];

}]);