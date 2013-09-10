cordovaExampleApp = angular.module 'cordovaExampleApp', ['CordovaExampleModel', 'hmTouchevents']

# Index: http://localhost/views/cordovaExample/index.html

cordovaExampleApp.controller 'IndexCtrl', ($scope, CordovaExampleRestangular)->

  # Helper function for opening new webviews
  $scope.open = (url)->
    webView = new steroids.views.WebView url
    steroids.layers.push webView

  # Fetch all objects from the local JSON (see app/models/cordovaExample.js)
  $scope.cordovaExamples = CordovaExampleRestangular.all('cordovaExample').getList()

  # -- Native navigation
  steroids.view.navigationBar.show "Cordova Examples"
