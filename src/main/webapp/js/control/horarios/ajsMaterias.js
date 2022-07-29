const sisa = angular.module("sisa", ['oitozero.ngSweetAlert']);
sisa.controller("materias", ['$scope', 'SweetAlert', '$http', function ($scope, SweetAlert, $http) {
    console.log("ANGULAR JS")

    $scope.arrayMaterias = []
    $scope.arrayPlanes = []


    $scope.datosProc = [
        {
            planEstudios1: " Plan de estudios Procesos industriales área: Manufactura 2020",
            materia: "Algebra lineal",
            cuatrimestre: "1"
        },
        {
            materia: "Quimica básica",
            cuatrimestre: "1"
        },
        {
            materia: "Organización Industrial",
            cuatrimestre: "1"
        },
        {
            materia: "Metrología",
            cuatrimestre: "1"
        },
        {
            materia: "Dibujo Industrial",
            cuatrimestre: "1"
        },
        {
            materia: "Tecnologías para la digitalización",
            cuatrimestre: "1"
        },
        {
            materia: "Inglés I",
            cuatrimestre: "1"
        },
        {
            materia: "Expresión Oral y Escrita I",
            cuatrimestre: "1"
        },
        {
            materia: "Formación Sociocultural I",
            cuatrimestre: "1"
        },
        {
            materia: "Funciones Matemáticas",
            cuatrimestre: "2"
        },
        {
            materia: "Física",
            cuatrimestre: "2"
        },
        {
            materia: "Probabilidad y estadística",
            cuatrimestre: "2"
        },
        {
            materia: "Electricidad y magnetismo",
            cuatrimestre: "2"
        },
        {
            materia: "Administración de la producción I",
            cuatrimestre: "2"
        },
        {
            materia: "Métodos y sistemas de trabajo",
            cuatrimestre: "2"
        },
        {
            materia: "Distribución de planta",
            cuatrimestre: "2"
        },
        {
            materia: "Costos de producción",
            cuatrimestre: "2"
        },
        {
            materia: "Inglés II",
            cuatrimestre: "2"
        },
        {
            materia: "Formación Sociocultural II",
            cuatrimestre: "2"
        },
        {
            materia: "Cálculo diferencial",
            cuatrimestre: "3"
        },
        {
            materia: "Control estadístico del proceso",
            cuatrimestre: "3"
        },
        {
            materia: "Procesos de manufactura I",
            cuatrimestre: "3"
        },
        {
            materia: "Tópicos de manufactura",
            cuatrimestre: "3"
        },
        {
            materia: "Distribución de planta",
            cuatrimestre: "3"
        },
        {
            materia: "Integradora I",
            cuatrimestre: "3"
        },
        {
            materia: "Métodos y sistemas de trabajo II",
            cuatrimestre: "3"
        },
        {
            materia: "Seguridad e higiene industrial",
            cuatrimestre: "3"
        },
        {
            materia: "Administración de producción I",
            cuatrimestre: "3"
        },
        {
            materia: "Inglés III",
            cuatrimestre: "3"
        },
        {
            materia: "Cálculo Integral",
            cuatrimestre: "4"
        },
        {
            materia: "Estructura y propiedades de los materiales",
            cuatrimestre: "4"
        },
        {
            materia: "Administración de la calidad",
            cuatrimestre: "4"
        },
        {
            materia: "Gestión ambiental",
            cuatrimestre: "4"
        },
        {
            materia: "Administración de producción II",
            cuatrimestre: "4"
        },
        {
            materia: "Dibujo industrial avanzado",
            cuatrimestre: "4"
        },
        {
            materia: "Fundamentos de ingeniería económica",
            cuatrimestre: "4"
        },
        {
            materia: "Inglés IV",
            cuatrimestre: "4"
        },
        {
            materia: "Formación Sociocultural III",
            cuatrimestre: "4"
        },
        {
            materia: "Fundamentos de legislación industrial",
            cuatrimestre: "5"
        },
        {
            materia: "Procesos de manufactura II",
            cuatrimestre: "5"
        },
        {
            materia: "Cadena de suministros",
            cuatrimestre: "5"
        },
        {
            materia: "Manufactura aplicada",
            cuatrimestre: "5"
        },
        {
            materia: "Procesos químicos",
            cuatrimestre: "5"
        },
        {
            materia: "Integradora II",
            cuatrimestre: "5"
        },
        {
            materia: "Inglés V",
            cuatrimestre: "5"
        },
        {
            materia: "Expresión Oral y Escrita II",
            cuatrimestre: "5"
        },
        {
            materia: "Formación Sociocultural IV",
            cuatrimestre: "5"
        }
    ]

    $scope.datosMeca = [
        {
            planEstudios1: " Plan de estudios Mecatrónica área: Automatización 2020",
            materia: "Algebra lineal",
            cuatrimestre: "1"
        },
        {
            materia: "Física",
            cuatrimestre: "1"
        },
        {
            materia: "Electricidad y magnetismo",
            cuatrimestre: "1"
        },
        {
            materia: "Herramientas informáticas 14.0",
            cuatrimestre: "1"
        },
        {
            materia: "Procesos productivos",
            cuatrimestre: "1"
        },
        {
            materia: "Elementos dimensionales",
            cuatrimestre: "1"
        },
        {
            materia: "Inglés I",
            cuatrimestre: "1"
        },
        {
            materia: "Expresión Oral y Escrita I",
            cuatrimestre: "1"
        },
        {
            materia: "Formación Sociocultural I",
            cuatrimestre: "1"
        },
        {
            materia: "Funciones Matemáticas",
            cuatrimestre: "2"
        },
        {
            materia: "Química básica",
            cuatrimestre: "2"
        },
        {
            materia: "Circuitos eléctricos",
            cuatrimestre: "2"
        },
        {
            materia: "Sistemas hidráulicos y neumáticos",
            cuatrimestre: "2"
        },
        {
            materia: "Electrónica analógica",
            cuatrimestre: "2"
        },
        {
            materia: "Control de motores",
            cuatrimestre: "2"
        },
        {
            materia: "Inglés II",
            cuatrimestre: "2"
        },
        {
            materia: "Formación Sociocultural II",
            cuatrimestre: "2"
        },
        {
            materia: "Cálculo diferencial",
            cuatrimestre: "3"
        },
        {
            materia: "Probabilidad y estadística",
            cuatrimestre: "3"
        },
        {
            materia: "Termodinámica",
            cuatrimestre: "3"
        },
        {
            materia: "Controladores lógicos programables",
            cuatrimestre: "3"
        },
        {
            materia: "Electrónica digital",
            cuatrimestre: "3"
        },
        {
            materia: "Sistemas mécanicos I",
            cuatrimestre: "3"
        },
        {
            materia: "Integradora I",
            cuatrimestre: "3"
        },
        {
            materia: "Inglés III",
            cuatrimestre: "3"
        },
        {
            materia: "Formación Sociocultural III",
            cuatrimestre: "3"
        },
        {
            materia: "Cálculo Integral",
            cuatrimestre: "4"
        },
        {
            materia: "Estructura y propiedades de los materiales",
            cuatrimestre: "4"
        },
        {
            materia: "Instrumentación industrial",
            cuatrimestre: "4"
        },
        {
            materia: "Análisis de circuitos electrónicos",
            cuatrimestre: "4"
        },
        {
            materia: "Dispositivos digitales",
            cuatrimestre: "4"
        },
        {
            materia: "Lenguaje de programación",
            cuatrimestre: "4"
        },
        {
            materia: "Dispositivos analógicos",
            cuatrimestre: "4"
        },
        {
            materia: "Inglés IV",
            cuatrimestre: "4"
        },
        {
            materia: "Formación Sociocultural IV",
            cuatrimestre: "4"
        },
        {
            materia: "Programación visual",
            cuatrimestre: "5"
        },
        {
            materia: "Integración de sistemas automáticos",
            cuatrimestre: "5"
        },
        {
            materia: "Microcontroladores",
            cuatrimestre: "5"
        },
        {
            materia: "Fundamentos de instrumentación virtual",
            cuatrimestre: "5"
        },
        {
            materia: "Sistemas de control",
            cuatrimestre: "5"
        },
        {
            materia: "Integradora II",
            cuatrimestre: "5"
        },
        {
            materia: "Inglés V",
            cuatrimestre: "5"
        },
        {
            materia: "Expresión Oral y Escrita I",
            cuatrimestre: "5"
        },
    ]

    $scope.datosMant = [
        {
            planEstudios1: " Plan de estudios Mantenimiento área: Industrial 2020",
            materia: "Algebra lineal",
            cuatrimestre: "1"
        },
        {
            materia: "Química básica",
            cuatrimestre: "1"
        },
        {
            materia: "Introducción al mantenimiento",
            cuatrimestre: "1"
        },
        {
            materia: "Seguridad y medio ambiente",
            cuatrimestre: "1"
        },
        {
            materia: "Tecnologías para la digitalización",
            cuatrimestre: "1"
        },
        {
            materia: "Administración del personal",
            cuatrimestre: "1"
        },
        {
            materia: "Inglés I",
            cuatrimestre: "1"
        },
        {
            materia: "Expresión Oral y Escrita I",
            cuatrimestre: "1"
        },
        {
            materia: "Formación Sociocultural I",
            cuatrimestre: "1"
        },
        {
            materia: "Funciones Matemáticas",
            cuatrimestre: "2"
        },
        {
            materia: "Física",
            cuatrimestre: "2"
        },
        {
            materia: "Electricidad y magnetismo",
            cuatrimestre: "2"
        },
        {
            materia: "Gestión del mantenimiento",
            cuatrimestre: "2"
        },
        {
            materia: "Calidad en el mantenimiento",
            cuatrimestre: "2"
        },
        {
            materia: "Dibujo industrial",
            cuatrimestre: "2"
        },
        {
            materia: "Métodos y sistemas de trabajo",
            cuatrimestre: "2"
        },
        {
            materia: "Costos y presupuestos",
            cuatrimestre: "2"
        },
        {
            materia: "Inglés II",
            cuatrimestre: "2"
        },
        {
            materia: "Cálculo diferencial",
            cuatrimestre: "3"
        },
        {
            materia: "Probabilidad y estadística",
            cuatrimestre: "3"
        },
        {
            materia: "Termodinámica",
            cuatrimestre: "3"
        },
        {
            materia: "Sistemas eléctricos",
            cuatrimestre: "3"
        },
        {
            materia: "Máquinas y mecanismos",
            cuatrimestre: "3"
        },
        {
            materia: "Electrónica analógica",
            cuatrimestre: "3"
        },
        {
            materia: "Integradora I",
            cuatrimestre: "3"
        },
        {
            materia: "Inglés III",
            cuatrimestre: "3"
        },
        {
            materia: "Formación Sociocultural III",
            cuatrimestre: "3"
        },
        {
            materia: "Cálculo Integral",
            cuatrimestre: "4"
        },
        {
            materia: "Estructura y propiedades de los materiales",
            cuatrimestre: "4"
        },
        {
            materia: "Máquinas eléctricas",
            cuatrimestre: "4"
        },
        {
            materia: "Redes de servicios industriales",
            cuatrimestre: "4"
        },
        {
            materia: "Electrónica digital",
            cuatrimestre: "4"
        },
        {
            materia: "Principios de la programación",
            cuatrimestre: "4"
        },
        {
            materia: "Sistemas neumáticos e hidráulicos",
            cuatrimestre: "4"
        },
        {
            materia: "Inglés IV",
            cuatrimestre: "4"
        },
        {
            materia: "Formación Sociocultural IV",
            cuatrimestre: "4"
        },
        {
            materia: "Instalaciones eléctricas",
            cuatrimestre: "5"
        },
        {
            materia: "Máquinas térmicas",
            cuatrimestre: "5"
        },
        {
            materia: "Mantenimiento a procesos de manufactura",
            cuatrimestre: "5"
        },
        {
            materia: "Automatización y robótica",
            cuatrimestre: "5"
        },
        {
            materia: "Ingeniería de materiales",
            cuatrimestre: "5"
        },
        {
            materia: "Integradora II",
            cuatrimestre: "5"
        },
        {
            materia: "Inglés V",
            cuatrimestre: "5"
        },
        {
            materia: "Expresión Oral y Escrita II",
            cuatrimestre: "5"
        },
        {
            materia: "Formación Sociocultural IV",
            cuatrimestre: "5"
        },

    ]

    $scope.consultarPlanesEstudio = ( ) =>{
        console.log("-----------------------------")
        console.log("ConsultarPlanesEstudio")
        $http({
            method: 'POST',
            url: 'Sisa-Ase/consultarPlanesEstudio'
        }).then(function (response){
            const {data: {listPlanesEstudio}} = response
            $scope.arrayMaterias = listPlanesEstudio;
            $scope.arrayPlanes = listPlanesEstudio;
            console.log("-------------------------------------")
            console.log(response)
        })
    }



    $scope.guardarMaterias = () => {
        SweetAlert.swal({
            title: "¿Seguro de asignar estás materias para impartir asesorías?",
            text: "Recuerda que estas materias serán reflejadas para los estudiantes",
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
                    SweetAlert.swal({
                        showCancelButton: false,
                        closeOnConfirm: true,
                        showConfirmButton: true,
                        allowEscapeKey: false,
                        type: "success",
                        title: "Materias asignadas correctamente.",
                        text: "Proceso completado."
                    });

            }else {
                SweetAlert.swal({
                    showCancelButton: false,
                    closeOnConfirm: true,
                    showConfirmButton: true,
                    allowEscapeKey: false,
                    type: "error",
                    title: "Error al asignar las materias para los estudiantes.",
                    text: "Algo salió mal, proceso incompleto."
                });
            }
        });
    }
}])