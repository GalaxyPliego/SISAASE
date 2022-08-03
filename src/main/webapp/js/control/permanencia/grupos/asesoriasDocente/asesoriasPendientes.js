var sisa = angular.module("sisa", ['smart-table','ui.bootstrap', 'oitozero.ngSweetAlert']);

sisa.controller("ControlAsesoriasDocente", ['$rootScope', '$scope', '$http', 'SweetAlert', function ($rootScope, $scope, $http, SweetAlert) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";
    $scope.currentPage = 1;
    $scope.pageCurrent = 1;
    $scope.registroPorPagina = 2;
    $scope.infoAsesoria = {}
        $scope.estados = [
                {
                        id: 1,
                        nombre: 'Pendiente'
                },
                {
                        id: 2,
                        nombre: 'Aceptada'
                },
                {
                        id: 3,
                        nombre: 'Rechazada'
                },
                {
                        id: 4,
                        nombre: 'Impartida'
                },
                {
                        id: 5,
                        nombre: 'Cancelada'
                }
        ]

    $scope.rembemberCurrentPage = (p) =>{
        $scope.currentPage = p;
    }

    $scope.pagina = (pagina) =>{
        $scope.pageCurrent = pagina;
    }


        $scope.modalAceptarR = (asesoria) =>{
                $scope.infoAsesoria = angular.copy({...asesoria,idEstadoAsesoria:null})
                console.log($scope.infoAsesoria)
                $('#aceptarRechazar').modal('show')

        }
        $scope.cerrarModalAceptarR = () => {
                $('#aceptarRechazar').modal('hide')
        }

        $scope.aceptarAsesoria = () => {
                console.log($scope.infoAsesoria)
                //Pasar a la otra lista. Borrarlo de la primer lista y pasarla a la otra
                //$scope.rowCollection = $scope.rowCollection.filter(solicitud => solicitud.id != $scope.infoAsesoria.id)
                //if ($scope.infoAsesoria.estado.nombre === 'Aceptada'){
                  //      $scope.rowCollection2.push(angular.copy($scope.infoAsesoria))
                //}
                //$scope.cerrarModalAceptarR()
           //$scope.infoAsesoria.idEstadoAsesoria.idEstadoAsesoria=3;
            //$scope.infoAsesoria.motivosRechazo="nose";
            $http({
                method: 'POST',
                url: '/SISAASE_war_exploded/isAceptadaORechazadaAction',
                data: 'data=' + JSON.stringify($scope.infoAsesoria)
            }).then(function successCallback (response){
                console.log(response)
                $scope.consultarAsesoriasPendientes()
                $scope.consultarAsesoriasAceptadas()
                //aqui
                $('#aceptarRechazar').modal('hide')
            }, function errorCallback (response) {
                console.log(response)
            })
        }


        $scope.modalFinalizar = (asesoria) => {
                $scope.infoAsesoria = angular.copy(asesoria)
                $('#finalizar').modal('show')
        }

        $scope.cerrarModalFinalizar = () => {
                $('#finalizar').modal('hide')
        }
    $scope.aceptarAsesoriaImpartida = () => {
        $scope.infoAsesoria.estado = $scope.estados[3]
        console.log($scope.infoAsesoria)
        //$scope.rowCollection2 = $scope.rowCollection2.filter(solicitud => solicitud.id != $scope.infoAsesoria.id)
        //$scope.cerrarModalFinalizar()
        $http({
            method:'POST',
            url:'/SISAASE_war_exploded/isImpartidaAction',
            data: 'data=' + JSON.stringify({idAsesoria: 1, idEstadoAsesoria:{
                    idEstadoAsesoria: 4, nombre:"Impartida"
                }, duracion: null})
        }).then(function successCallback (response) {
            console.log(response)
        },function errorCallback (response) {
            console.log(response)
        })
    }

        $scope.modalCancelar = (asesoria) => {
                $scope.infoAsesoria = angular.copy(asesoria)
                $('#cancelar').modal('show')
        }

        $scope.cerrarModalCancelar = () => {
                $('#cancelar').modal('hide')
        }

        $scope.boton = () =>{
                console.log($scope.formularioAceptarAsesoria)
        }


        $scope.cancelarAsesoria = () => {
                console.log("Holaaa, entroooo")
                SweetAlert.swal(
                    {
                            title: "¡Advertencia!",
                            text: "¿Estas seguro de realizar los cambios?",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonColor: "#DD6B55",
                            confirmButtonText: "Aceptar",
                            cancelButtonText: "Cancelar",
                            closeOnConfirm: false,
                    },
                    function (isConfirm) {
                            if (isConfirm) {
                                    $scope.infoAsesoria.estado = $scope.estados[4]
                                    console.log($scope.infoAsesoria)
                                    $scope.rowCollection2 = $scope.rowCollection2.filter(solicitud => solicitud.id != $scope.infoAsesoria.id)
                                    $scope.cerrarModalCancelar()
                                    SweetAlert.swal(
                                        "Exitoso!",
                                        "La asesoría se ha cancelado exitosamente",
                                        "success"
                                    );
                            }
                    }
                );

        }


        $scope.consultarAsesoriasPendientes = () =>{
            console.log("Holi")
            $http({
                method: 'GET',
                url: '/SISAASE_war_exploded/consultarAsesoriasPendientesDocenteAction',
            }).then(function successCallback (response){
               $scope.listaAsesoriasPendientes = response.data.listaAsesorias;
                console.log($scope.listaAsesoriasPendientes)
            },function errorCallback (response){
                console.log(response);
            })
        }

    $scope.consultarAsesoriasAceptadas = () =>{
        console.log("Holi")
        $http({
            method: 'GET',
            url: '/SISAASE_war_exploded/consultarAsesoriasAceptadasDocenteAction',
        }).then(function successCallback (response){
            $scope.listaAsesoriasAceptadas = response.data.listaAsesorias;
            console.log($scope.listaAsesoriasAceptadas)
        },function errorCallback (response){
            console.log(response);
        })
    }




    $scope.rowCollection = [
                { id: 1, fecha: '2022/05/25', hora: '20:00', estudiante: {
                                nombre: 'Nath Escalona Ruiz',
                                matricula: '20203TN082',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 6,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Aplicaciones Web' , tema: 'API REST', dudas: ' ¿Qué significa API REST?.', estado:{id: 1,nombre: 'Pendiente'}},
                { id: 2, fecha: '2021/05/21', hora: '15:00', estudiante: {
                                nombre: 'Hector Ulises Stamatio Ferraez',
                                matricula: '20203TN159',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 7,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 1,nombre: 'Pendiente'} },
                { id: 3, fecha: '2021/05/22', hora: '13:00', estudiante: {
                                nombre: 'Ricardo Cardenas Guevara',
                                matricula: '20203TN077',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 8,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 1,nombre: 'Pendiente'} },
                { id: 4, fecha: '2021/05/20', hora: '14:00', estudiante:{
                                nombre: 'Nathaly Escalona Ruiz',
                                matricula: '20203TN082',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 6,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 1,nombre: 'Pendiente'}},
                { id: 5, fecha: '2021/05/21', hora: '15:00', estudiante: {
                                nombre: 'Hector Ulises Stamatio Ferraez',
                                matricula: '20203TN159',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 7,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 1,nombre: 'Pendiente'} },
                { id: 6, fecha: '2021/05/22', hora: '13:00', estudiante:{
                                nombre: 'Ricardo Cardenas Guevara',
                                matricula: '20203TN077',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 8,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 1,nombre: 'Pendiente'} },

        ]


        $scope.predicates = ['fecha', 'hora', 'nombre', 'tema', 'estado'];
        $scope.selectedPredicate = $scope.predicates[0];


        $scope.rowCollection2 = [
                { id: 7, fecha: '2021/05/20', hora: '14:00', estudiante: {
                                nombre: 'Nathaly Escalona Ruiz',
                                matricula: '20203TN082',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 6,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 2,nombre: 'Aceptada'}},
                { id: 8, fecha: '2021/05/21', hora: '15:00', estudiante: {
                                nombre: 'Hector Ulises Stamatio Ferraez',
                                matricula: '20203TN159',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 7,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 2,nombre: 'Aceptada'} },
                { id: 9, fecha: '2021/05/22', hora: '13:00', estudiante: {
                                nombre: 'Ricardo Cardenas Guevara',
                                matricula: '20203TN077',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 8,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.',estado:{id: 2,nombre: 'Aceptada'} },
                { id: 10, fecha: '2021/05/20', hora: '14:00', estudiante: {
                                nombre: 'Nathaly Escalona Ruiz',
                                matricula: '20203TN082',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 6,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 2,nombre: 'Aceptada'}},
                { id: 11, fecha: '2021/05/21', hora: '15:00', estudiante: {
                                nombre: 'Hector Ulises Stamatio Ferraez',
                                matricula: '20203TN159',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 7,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 2,nombre: 'Aceptada'} },
                { id: 12, fecha: '2021/05/22', hora: '13:00', estudiante: {
                                nombre: 'Ricardo Cardenas Guevara',
                                matricula: '20203TN077',
                                carrera: 'Desarrollo de Software Multiplataforma',
                                grado: 8,
                                grupo: 'C',
                                riesgo: 'No'
                        }, asignatura: 'Base de Datos' , tema: 'Sentencias SQL', dudas: ' Sentencias básicas, create, alter table, etc.', estado:{id: 2,nombre: 'Aceptada'} },
        ]


        $scope.campos = ['fecha', 'hora', 'nombre', 'tema', 'estado'];
        $scope.selectedCampos = $scope.campos[0];

}]);
