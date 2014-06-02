sidemenuApp = angular.module 'sidemenuApp', ['SidemenuModel', 'ngTouch']

sidemenuApp.controller 'IndexCtrl', ($scope, SidemenuRestangular)->

  SidemenuRestangular.all('sidemenu').getList().then (sidemenu)->
    $scope.sidemenu = sidemenu;

  window.addEventListener "message", (e)->
    if e.data.recepient == 'sidemenu' and e.data.message == 'switch-first'
      _markActive($scope.sidemenu[0])

  _checkDefault = (item) ->
    if item.active and not $scope.currentItem
      $scope.currentItem = item

  _markActive = (item)->
    if $scope.currentItem
      $scope.currentItem.active = false
    $scope.currentItem = item
    item.active = true
    $scope.$apply()

  $scope.isActive = (item)->
    _checkDefault(item)
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
    _markActive(item)
