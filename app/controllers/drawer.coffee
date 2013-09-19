document.addEventListener "deviceready", ->
  angular.bootstrap document, ['drawerApp']

drawerApp = angular.module 'drawerApp', ['hmTouchevents']

drawerApp.controller 'IndexCtrl', ($scope)->

  steroids.view.navigationBar.show "Drawer"
  $scope.selectedInDrawer = "Nothing, yet"

  # Listen for messages sent to our drawer example
  window.addEventListener "message", (msg)->
    if msg.data.exampleName is "drawer"
      $scope.selectedInDrawer = msg.data.selection
      $scope.$apply()

  # Initialize the left drawer
  leftDrawer = new steroids.views.WebView("/views/drawer/drawer.html")

  # Ensure that we only ever preload one drawer
  leftDrawer.preload( {id: "drawerExample"},
    onFailure: (msg)->
      if msg.errorDescription is "A preloaded layer with this identifier already exists"
        console.log "Drawer already preloaded."
        # We know that preloading failed because there is a view that is already preloaded with this id.
        # Thus, we can force our WebView object to point to the preloaded layer.
        leftDrawer.id = "drawerExample"
      else
        alert msg.errorDescription # something else went wrong
    onSuccess: ()->
      console.log "Preloaded drawer with id: drawerExample"
  )

  $scope.gestureEnabled = false

  $scope.openDrawer = ()->
    steroids.drawers.show(leftDrawer)

  $scope.enableGesture = ()->
    steroids.drawers.enableGesture(leftDrawer)
    $scope.gestureEnabled = true

  $scope.disableGesture = ()->
    steroids.drawers.disableGesture()
    $scope.gestureEnabled = false

  $scope.openLayer = ()->
    disabledView = new steroids.views.WebView("/views/drawer/disabled.html")
    steroids.layers.push(disabledView)

  document.addEventListener "visibilitychange", ->
    if !document.hidden and $scope.gestureEnabled
      steroids.drawers.enableGesture(leftDrawer)

drawerApp.controller 'DrawerCtrl', ($scope)->

  $scope.closeDrawerAndSendMessage = (selection)->
    msg =
      selection: selection
      exampleName: "drawer"
    window.postMessage(msg, "*")

    steroids.drawers.hideAll()

  $scope.openGoogle = ()->
    steroids.openURL("http://www.google.com")

drawerApp.controller 'DisabledCtrl', ($scope)->

  document.addEventListener "visibilitychange", ->
    if !document.hidden
      steroids.drawers.disableGesture()