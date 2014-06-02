settingsApp = angular.module 'settingsApp', ['navigationBar', 'ngTouch']

settingsApp.controller 'IndexCtrl', ($scope)->

  $scope.showMenu = ()->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  $scope.$watch "assignments", () ->
    closeButton = new steroids.buttons.NavigationBarButton()
    closeButton.imagePath = "/vendor/icons8/delete_sign-32.png"
    closeButton.onTap = ->
      # Here I need to provide changes
      # into SidemenuModel so that
      # first item would have active: true,
      # and others have active: false
      window.postMessage { recepient: "sidemenu", message: "switch-first" }

      initial = "http://localhost/views/example/index.html"
      steroids.layers.replace {
        view: new steroids.views.WebView {
          id: initial,
          location: initial
        }
      }

    steroids.view.navigationBar.update {
      buttons:
        right: [closeButton]
    }

