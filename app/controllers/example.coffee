exampleApp = angular.module 'exampleApp', ['ExampleModel', 'ngTouch']

exampleApp.controller 'IndexCtrl', ($scope, ExampleRestangular)->

  rightDrawerView = new steroids.views.WebView {location:"/views/settings/index.html", id:"rightDrawer"}
  window.ViewController = {
    rightDrawer: rightDrawerView
  }

  updateDrawers = ()->
    steroids.drawers.update {
        right: ViewController.rightDrawer
      }

  updateDrawers()

  $scope.open = (url)->
    if url == '/views/settings/index.html'
      steroids.drawers.show({
        edge: steroids.screen.edges.RIGHT
      }, {
        onSuccess: ()->
          steroids.logger.log('success')
        onFailure: ()->
          steroids.logger.log('fail')
      })
      return

    webView = new steroids.views.WebView url
    steroids.layers.push webView

  ExampleRestangular.all('example').getList().then (examples)->
    $scope.examples = examples;

  #Native navigation
  steroids.view.navigationBar.show "Steroids Kitchensink"
  steroids.view.setBackgroundColor "#FFFFFF"
