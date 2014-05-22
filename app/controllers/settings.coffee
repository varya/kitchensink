settingsApp = angular.module 'settingsApp', ['ngTouch']

settingsApp.controller 'IndexCtrl', ($scope)->

  menuButton = new steroids.buttons.NavigationBarButton
  menuButton.imagePath = "/vendor/icons8/menu-32.png"
  menuButton.onTap = =>
      steroids.drawers.show {
        edge: steroids.screen.edges.LEFT
      }

  steroids.navigationBar.update
    buttons:
        left: [menuButton]
