settingsApp = angular.module 'settingsApp', ['navigationBar', 'ngTouch']

settingsApp.controller 'IndexCtrl', ($scope)->

  $scope.showMenu = ()->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  $scope.$watch "assignments", () ->
    closeButton = new steroids.buttons.NavigationBarButton()
    closeButton.imagePath = "/vendor/icons8/dice-32.png"
    closeButton.onTap = ->

    steroids.view.navigationBar.update {
      buttons:
        right: [closeButton]
    }

