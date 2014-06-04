settingsApp = angular.module 'settingsApp', ['navigationBar', 'ngTouch']

settingsApp.controller 'IndexCtrl', ($scope)->

  $scope.showMenu = ()->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  $scope.$watch "assignments", () ->
    diceButton = new steroids.buttons.NavigationBarButton()
    diceButton.imagePath = "/vendor/icons8/dice-32.png"

    steroids.view.navigationBar.update {
      buttons:
        right: [diceButton]
    }
