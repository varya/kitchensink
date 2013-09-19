exampleApp = angular.module 'exampleApp', ['ExampleModel', 'hmTouchevents']

# Cordova examples index: views/index/cordova.html

exampleApp.controller 'CordovaIndexCtrl', ($scope, ExampleRestangular)->

  # Helper function for opening new webviews
  $scope.open = (url)->
    webView = new steroids.views.WebView url
    steroids.layers.push webView

  # Fetch all objects from the local JSON (see app/models/cordovaExample.js)
  $scope.cordovaExamples = ExampleRestangular.all('cordovaExamples').getList()

  # -- Native navigation
  steroids.view.navigationBar.show "Cordova"


# Steroids examples index: views/index/steroids.html

exampleApp.controller 'SteroidsIndexCtrl', ($scope, ExampleRestangular)->

  # Helper function for opening new webviews
  $scope.open = ($event)->
    alert($event)
    # webView = new steroids.views.WebView url
    # steroids.layers.push webView

  # Fetch all objects from the local JSON (see app/models/steroidsExample.js)
  $scope.steroidsExamples = ExampleRestangular.all('steroidsExamples').getList()

  # -- Native navigation
  steroids.view.navigationBar.show "Steroids"
