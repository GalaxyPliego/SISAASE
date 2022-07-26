const sisa = angular.module("sisa", ['smart-table', 'oitozero.ngSweetAlert']);

sisa.controller("resumenHistorial", ['$rootScope', '$scope', '$http', 'SweetAlert', '$filter', function ($rootScope, $scope, $http, SweetAlert, filter) {
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.find = () => {
        console.log("Entró al findResumenHistorial")
        $http({
            method: 'GET',
            url: 'sisaase/findResumenHistorial'
        }).then(function(response){
            console.log(response)
            const {data: {listResumenHistorial}} = response
            $scope.listResumenHistorial = listResumenHistorial
        })
    }

}]);

