exampleApp = angular.module 'exampleApp', ['ExampleModel', 'ngTouch']

exampleApp.controller 'IndexCtrl', ($scope, ExampleRestangular)->

  $scope.open = (url)->

    webView = new steroids.views.WebView url
    steroids.layers.push webView

  ExampleRestangular.all('example').getList().then (examples)->
    $scope.examples = examples;

  #Native navigation
  steroids.view.navigationBar.show "Steroids Kitchensink"
  steroids.view.setBackgroundColor "#FFFFFF"

  menuButton = new steroids.buttons.NavigationBarButton
  menuButton.imagePath = "/vendor/icons8/menu-32.png"
  menuButton.onTap = =>
      steroids.drawers.show({
        edge: steroids.screen.edges.LEFT
      }, {
        onSuccess: ()->
          steroids.logger.log('success')
        onFailure: ()->
          steroids.logger.log('fail')
      })

  steroids.navigationBar.update
    buttons:
        left: [menuButton]
