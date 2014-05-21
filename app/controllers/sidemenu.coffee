sidemenuApp = angular.module 'sidemenuApp', ['ngTouch']

sidemenuApp.controller 'IndexCtrl', ($scope)->

  $scope.back = ()->
    steroids.drawers.hide {}
