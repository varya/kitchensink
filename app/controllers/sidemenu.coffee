sidemenuApp = angular.module 'sidemenuApp', ['ngTouch']

sidemenuApp.controller 'IndexCtrl', ($scope)->

  $scope.back = ()->
    steroids.drawers.hide {}

  $scope.open = (url)->
    tictacView = new steroids.views.WebView {
        id: 'tictacDrawer'
        location: url
    }
    steroids.drawers.hide {
        center: tictacView
    }
    steroids.logger.log(tictacView)
