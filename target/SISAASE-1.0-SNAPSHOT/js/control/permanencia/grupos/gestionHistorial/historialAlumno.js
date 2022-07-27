const sisa = angular.module("sisa", ['smart-table', 'oitozero.ngSweetAlert']);

sisa.controller("historialAlumno", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.rowCollection = [
        {fecha: '24/02/2022', hora: '13:00', duracion: '60', docente: 'Cesar Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/01/2022', hora: '14:00', duracion: '30', docente: 'Mike Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '02:00', duracion: '20', docente: 'Mireles Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/05/2022', hora: '15:00', duracion: '10', docente: 'Carlos Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/07/2022', hora: '13:00', duracion: '50', docente: 'Tania Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '16:00', duracion: '80', docente: 'Liz Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '13:00', duracion: '60', docente: 'Cesar Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/01/2022', hora: '14:00', duracion: '30', docente: 'Mike Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '02:00', duracion: '20', docente: 'Mireles Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/05/2022', hora: '15:00', duracion: '10', docente: 'Carlos Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/07/2022', hora: '13:00', duracion: '50', docente: 'Tania Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '16:00', duracion: '80', docente: 'Liz Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '13:00', duracion: '60', docente: 'Cesar Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/01/2022', hora: '14:00', duracion: '30', docente: 'Mike Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '02:00', duracion: '20', docente: 'Mireles Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/05/2022', hora: '15:00', duracion: '10', docente: 'Carlos Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/07/2022', hora: '13:00', duracion: '50', docente: 'Tania Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '16:00', duracion: '80', docente: 'Liz Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '13:00', duracion: '60', docente: 'Cesar Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/01/2022', hora: '14:00', duracion: '30', docente: 'Mike Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '02:00', duracion: '20', docente: 'Mireles Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/05/2022', hora: '15:00', duracion: '10', docente: 'Carlos Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/07/2022', hora: '13:00', duracion: '50', docente: 'Tania Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '16:00', duracion: '80', docente: 'Liz Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '13:00', duracion: '60', docente: 'Cesar Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/01/2022', hora: '14:00', duracion: '30', docente: 'Mike Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '02:00', duracion: '20', docente: 'Mireles Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/05/2022', hora: '15:00', duracion: '10', docente: 'Carlos Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/07/2022', hora: '13:00', duracion: '50', docente: 'Tania Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '16:00', duracion: '80', docente: 'Liz Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '13:00', duracion: '60', docente: 'Cesar Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/01/2022', hora: '14:00', duracion: '30', docente: 'Mike Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '02:00', duracion: '20', docente: 'Mireles Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/05/2022', hora: '15:00', duracion: '10', docente: 'Carlos Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/07/2022', hora: '13:00', duracion: '50', docente: 'Tania Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},
        {fecha: '24/02/2022', hora: '16:00', duracion: '80', docente: 'Liz Morales Galvan', asignatura: 'Base de Datos', tema: 'Triggers', estado: 'Terminada', dudas: 'Sí'},




    ];

    $scope.predicates = ['fecha', 'hora', 'duracion', 'docente', 'asignatura', 'tema', 'estado', 'dudas'];
    $scope.selectedPredicate = $scope.predicates[0];

}]);