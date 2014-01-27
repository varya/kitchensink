tabsApp = angular.module 'tabsApp', ['TabsModel', 'hmTouchevents']

# Cordova tabs index: views/tabs/cordova.html

tabsApp.controller 'CordovaCtrl', ($scope, TabsRestangular)->

  # Helper function for opening new webviews
  $scope.open = (url)->
    webView = new steroids.views.WebView url
    steroids.layers.push webView

  # Fetch all objects from the local JSON (see app/models/tabs.js)
  $scope.cordovaExamples = TabsRestangular.all('cordovaExamples').getList()

  # -- Native navigation
  steroids.view.navigationBar.show "Cordova"


# Steroids tabs index: views/tabs/steroids.html

tabsApp.controller 'SteroidsCtrl', ($scope, TabsRestangular)->

  # Helper function for opening new webviews
  $scope.open = (url)->
    webView = new steroids.views.WebView url
    steroids.layers.push webView

  # Fetch all objects from the local JSON (see app/models/tabs.js)
  $scope.steroidsExamples = TabsRestangular.all('steroidsExamples').getList()

  # -- Native navigation
  steroids.view.navigationBar.show "Steroids"

# Steroids Addons tab index: views/tabs/steroids-addons.html

tabsApp.controller 'SteroidsAddonsCtrl', ($scope, TabsRestangular) ->

  # Helper function for opening new webviews
  $scope.open = (url)->
    webView = new steroids.views.WebView url
    steroids.layers.push webView

  # Fetch all objects from the local JSON (see app/models/tabs.js)
  $scope.steroidsAddonExamples = TabsRestangular.all('steroidsAddonExamples').getList()

  # -- Native navigation
  steroids.view.navigationBar.show "Steroids Addons"