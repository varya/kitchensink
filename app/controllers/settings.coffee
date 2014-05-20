settingsApp = angular.module 'settingsApp', ['ngTouch']

settingsApp.controller 'IndexCtrl', ($scope)->

  alet('settings')

  #Native navigation
  steroids.view.navigationBar.show "Steroids Kitchensink"
  steroids.view.setBackgroundColor "#FFFFFF"
