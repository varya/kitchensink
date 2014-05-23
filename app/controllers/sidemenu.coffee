sidemenuApp = angular.module 'sidemenuApp', ['SidemenuModel', 'ngTouch']

sidemenuApp.controller 'IndexCtrl', ($scope, SidemenuRestangular)->

  SidemenuRestangular.all('sidemenu').getList().then (sidemenu)->
    $scope.sidemenu = sidemenu;

  $scope.isActive = (item)->
    if item.active
        $scope.currentItem = item
    return item.active

  $scope.switchMenu = (item)->
    if item.active
      steroids.drawers.hide {}
    else
      webView = new steroids.views.WebView {
        id: item.id,
        location: item.url
      }
      steroids.drawers.hide {
        center: webView
      }
      item.active = true
      $scope.currentItem && $scope.currentItem.active = false
      $scope.currentItem = item
