settingsApp = angular.module 'settingsApp', ['SidemenuModel', 'navigationBar', 'ngTouch']

settingsApp.controller 'IndexCtrl', ($scope, SidemenuRestangular)->

  $scope.showMenu = ()->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  SidemenuRestangular.all('sidemenu').getList().then (sidemenu) ->
    $scope.sidemenu = sidemenu;

  $scope.$watch "assignments", () ->
    closeButton = new steroids.buttons.NavigationBarButton()
    closeButton.imagePath = "/vendor/icons8/delete_sign-32.png"
    closeButton.onTap = ->
      # Here I need to provide changes
      # into SidemenuModel so that
      # first item would have active: true,
      # and others have active: false
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

