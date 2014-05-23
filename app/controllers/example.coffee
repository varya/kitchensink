exampleApp = angular.module 'exampleApp', ['ExampleModel', 'navigationBar', 'ngTouch']

exampleApp.controller 'IndexCtrl', ($scope, ExampleRestangular)->

  $scope.open = (url)->
    webView = new steroids.views.WebView url
    steroids.layers.push webView

  $scope.showMenu = ()->
    steroids.drawers.show {
      edge: steroids.screen.edges.LEFT
    }

  ExampleRestangular.all('example').getList().then (examples)->
    $scope.examples = examples;

  #Native navigation
  steroids.view.navigationBar.show()
  steroids.view.setBackgroundColor "#FFFFFF"
