const sisa = angular.module("sisa", ['oitozero.ngSweetAlert']);
sisa.controller("gestionhorarios", ['$scope', 'SweetAlert', '$http', function ($scope, SweetAlert, $http) {
    console.log("- ANGULAR JS -")

    $scope.arrayDias = []

    $scope.mostrarLeyenda = true;

    $scope.datos = [
        {
            horaInicio: "",
            horaFin: "",
            idDia: "1",
            dia: "Lunes",
            idProfesor: "45"
        },
        {
            horaInicio: "",
            horaFin: "",
            idDia: "2",
            dia: "Martes",
            idProfesor: "45"
        },
        {
            horaInicio: "",
            horaFin: "",
            idDia: "3",
            dia: "Miercoles",
            idProfesor: "45"
        },
        {
            horaInicio: "",
            horaFin: "",
            idDia: "4",
            dia: "Jueves",
            idProfesor: "45"
        },
        {
            horaInicio: "",
            horaFin: "",
            dia: "Viernes",
            idDia: "5",
            idProfesor: "45"
        },
        {
            horaInicio: "",
            horaFin: "",
            dia: "Sabado",
            idDia: "6",
            idProfesor: "45"
        }
    ]

    $scope.periodoCuatri = [
        {
            periodo: "Mayo 2022 - Agosto 2022"
        },
        {
            periodo: "Enero 2022 - Abril 2022"
        },
        {
            periodo: "Septiembre 2021 - Diciembre 2021"
        },
        {
            periodo: "Mayo 2021 - Agosto 2021"
        },
        {
            periodo: "Enero 2021 - Abril 2021"
        },
        {
            periodo: "Septiembre 2020 - Diciembre 2020"
        },
        {
            periodo: "Mayo 2020 - Agosto 2020"
        },
        {
            periodo: "Enero 2020 - Abril 2020"
        }

    ]

    $scope.dia = {
        selected: {}
    };

    $scope.consultarDias = ( ) =>{
        console.log("ConsultarDias")
        $http({
            method: 'POST',
            url: 'Sisa-Ase/consultarDias'
        }).then(function (response){
            const {data: {listDiaSemana}} = response
            $scope.arrayDias = listDiaSemana;
            console.log("-------------------------------------")
            console.log(response)
        })
    }

    $scope.agregarHorario = (entrada) => {
        $scope.agregarHora = angular.copy(entrada)
        console.log($scope.agregarHora)
        $('#agregarHorario').modal('toggle')
    }

    $scope.agregar = (diaRemplazo) => {
            SweetAlert.swal({
                title: "¿Seguro de asignar este horario para impartir asesorías?",
                text: "Recuerda que este horario sera reflejado para los estudiantes",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Aceptar",
                cancelButtonText: "Cancelar",
                closeOnConfirm: false,
                closeOnCancel: true,
                showLoaderOnConfirm: true,

            }, function (isConfirm) {
                if (isConfirm) {
                    diaRemplazo.horaInicio = $scope.horaInicio
                    diaRemplazo.horaFin = $scope.horaFin
                    $scope.datos.splice($scope.datos.map(function (e) {
                        return e.idDia;
                    }).indexOf(diaRemplazo.idDia), 1, diaRemplazo)
                    console.log($scope.datos)
                    $scope.horaInicio = ""
                    $scope.horaFin = ""
                    $('#agregarHorario').modal('hide')
                    SweetAlert.swal({
                        showCancelButton: false,
                        closeOnConfirm: true,
                        showConfirmButton: true,
                        allowEscapeKey: false,
                        type: "success",
                        title: "Horario asignado correctamente.",
                        text: "Proceso completado."
                    });
                } else {
                    SweetAlert.swal({
                        showCancelButton: false,
                        closeOnConfirm: true,
                        showConfirmButton: true,
                        allowEscapeKey: false,
                        type: "error",
                        title: "Error al asignar el horario para los estudiantes.",
                        text: "Algo salió mal, proceso incompleto."
                    });
                }
            });

    }

    $scope.select = function (index) {
        $scope.indexAction = index
        $scope.update = {...$scope.datos[index]}
        $('#actualizarHorario').modal('toggle')
    };

    $scope.actualizarHorario = () => {

        SweetAlert.swal({
            title: "¿Seguro de modificar este horario para impartir asesorías?",
            text: "Recuerda que este horario sera reflejado para los estudiantes",
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

                $scope.datos[$scope.indexAction] = {...$scope.update}
                $('#actualizarHorario').modal('hide')
                SweetAlert.swal({
                    showCancelButton: false,
                    closeOnConfirm: true,
                    showConfirmButton: true,
                    allowEscapeKey: false,
                    type: "success",
                    title: "Horario modificado correctamente.",
                    text: "Proceso completado."
                });

            } else {
                SweetAlert.swal({
                    showCancelButton: false,
                    closeOnConfirm: true,
                    showConfirmButton: true,
                    allowEscapeKey: false,
                    type: "error",
                    title: "Error al asignar el horario para los estudiantes.",
                    text: "Algo salió mal, proceso incompleto."
                });
            }
        });


    }

    $scope.selectDay = (index) => {
        $scope.datos[index].checked = !$scope.datos[index].checked;
        console.log($scope.datos[index].checked = !$scope.datos[index].checked)
    }

    $scope.eliminarHorario = function (diaRemplazo) {

        SweetAlert.swal({
            title: "¿Seguro de eliminar este horario?",
            text: "No se podrá deshacer la acción",
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
                diaRemplazo.horaInicio = $scope.horaInicio = ""
                diaRemplazo.horaFin = $scope.horaFin = ""
                $scope.datos.splice($scope.datos.map(function (e) {
                    return e.idDia;
                }).indexOf(diaRemplazo.idDia), 1, diaRemplazo)
                console.log($scope.datos)
                console.log("Eliminado correctamente")

                SweetAlert.swal({
                    showCancelButton: false,
                    closeOnConfirm: true,
                    showConfirmButton: true,
                    allowEscapeKey: false,
                    type: "success",
                    title: "Horario eliminado correctamente.",
                    text: "Proceso completado."
                });

            } else {
                SweetAlert.swal({
                    showCancelButton: false,
                    closeOnConfirm: true,
                    showConfirmButton: true,
                    allowEscapeKey: false,
                    type: "error",
                    title: "Error al eliminar el horario",
                    text: "Algo salió mal, proceso incompleto."
                });
            }
        });


    }


}])