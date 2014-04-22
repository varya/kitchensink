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