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

  _colorSchemes = [
    ['#c94a4a', '#FFFFFF']
    ['#75873e', '#FFFFFF']
    ['#dd97c7', '#000000']
    ['#74d0ad', '#000000']
    ['#4c1a2c', '#FFFFFF']
    ['#c98f57', '#000000']
    ['#5b8ecb', '#FFFFFF']
  ]

  $scope.$watch "assignments", () ->
    diceButton = new steroids.buttons.NavigationBarButton()
    diceButton.imagePath = "/vendor/icons8/dice-32.png"
    diceButton.onTap = ->
      clr = _colorSchemes[Math.floor(Math.random()*_colorSchemes.length)];
      steroids.view.navigationBar.setAppearance {
        titleTextColor: clr[1]
        buttonTintColor: clr[1]
        tintColor: clr[0]
      }

    steroids.view.navigationBar.update {
      buttons:
        right: [diceButton]
    }
