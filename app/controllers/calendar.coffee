document.addEventListener "deviceready", ->
  angular.bootstrap document, ['calendarApp']

calendarApp = angular.module 'calendarApp', ['hmTouchevents']

calendarApp.controller 'IndexCtrl', ($scope)->

  steroids.view.navigationBar.show("Calendar")

  # INITIALIZATION
  $scope.calendarStatus = "Initializing..."
  $scope.event =
    title: "My Birthday"
    location: "House of Dolan"
    notes: "Remember to bring cake!"
    startDate: "2013-09-18 18:00:00"
    endDate: "2013-09-19 04:30:00"

  calInitSuccess = ->
    $scope.calendarStatus = "Initialized."
    $scope.$apply()

  calInitFail = ->
    $scope.calendarStatus = "Initialization failed."
    $scope.$apply()

  window.plugins.calendarPlugin.initialize calInitSuccess, calInitFail

  # EVENT CREATION
  $scope.createEvent = ->
    calCreateSuccess = (msg)->
      console.log 'Calendar event creation success: ' + msg

    calCreateFail = (err)->
      alert 'Calendar event creation failure: ' + err

    window.plugins.calendarPlugin.createEvent(
      $scope.event.title,
      $scope.event.location,
      $scope.event.notes,
      $scope.event.startDate,     # must be in format 'yyyy-mm-dd hh:mm:ss'
      $scope.event.endDate,       # must be in format 'yyyy-mm-dd hh:mm:ss'
      calCreateSuccess,
      calCreateFail
    )

  # EVENT DELETION
  $scope.deleteEvent = ->
    calDeleteSuccess = (msg)->
      alert "Delete success: " + msg

    calDeleteFail = (err)->
      alert "Search success: " + err

    window.plugins.calendarPlugin.deleteEvent(
      $scope.event.title,
      $scope.event.location,
      $scope.event.notes,
      $scope.event.startDate,     # must be in format 'yyyy-mm-dd hh:mm:ss'
      $scope.event.endDate,       # must be in format 'yyyy-mm-dd hh:mm:ss'
      true,                       # delete all or just one found event
      calDeleteSuccess,           # delete success callback fires even if no events are found
      calDeleteFail
    )

  # EVENT SEARCH
  $scope.findEvents = ->
    calFindSuccess = (result)->
      alert "Find success: " + JSON.stringify(result)
    calFindFail = (err)->
      alert "Find error: " + err

    window.plugins.calendarPlugin.findEvent(
      $scope.event.title,
      $scope.event.location,
      $scope.event.notes,
      $scope.event.startDate,     # must be in format 'yyyy-mm-dd hh:mm:ss'
      $scope.event.endDate,       # must be in format 'yyyy-mm-dd hh:mm:ss'
      calFindSuccess,
      calFindFail
    )