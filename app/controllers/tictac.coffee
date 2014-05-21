tictacApp = angular.module 'tictacApp', ['ngTouch']

tictacApp.controller 'IndexCtrl', ($scope)->

  steroids.view.navigationBar.show "Tic tac toe"

  backButton = new steroids.buttons.NavigationBarButton
  backButton.title = "Examples"
  backButton.onTap = =>
    webView = new steroids.views.WebView {
        id: 'views/example/index.html'
        location: 'views/example/index.html'
    }
    webView.preload {},
    {
      onSuccess: =>
        steroids.layers.replace(webView)
    }

  steroids.navigationBar.update
    buttons:
        left: [backButton]
