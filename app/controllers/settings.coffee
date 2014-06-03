settingsApp = angular.module 'settingsApp', ['navigationBar', 'ngTouch']

settingsApp.controller 'IndexCtrl', ($scope, $q)->

  deferred = $q.defer()
  steroids.view.setAllowedRotations {
    allowedRotations: [0,180,-90,90]
  }, {
    onSuccess: () ->
      deferred.resolve ''
  }
  promise = deferred.promise

  $scope.showMenu = ()->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  $scope.changeOrientation = (orientation) ->
    promise.then ()->
      switch orientation
        when 'landscapeLeft' then steroids.screen.rotate orientation
        when 'landscapeRight' then steroids.screen.rotate orientation
        when 'portraitUpsideDown' then steroids.screen.rotate orientation
        when 'portrait' then steroids.screen.rotate orientation

  $scope.$watch "assignments", () ->
    closeButton = new steroids.buttons.NavigationBarButton()
    closeButton.imagePath = "/vendor/icons8/delete_sign-32.png"
    closeButton.onTap = ->
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

