document.addEventListener "deviceready", ->
  angular.bootstrap document, ['animationApp']

animationApp = angular.module 'animationApp', ['hmTouchevents']

animationApp.controller 'IndexCtrl', ($scope)->

  steroids.view.navigationBar.show "Animation"

  $scope.performAnimation = (transition, duration)->

    anim = new steroids.Animation
      transition: transition
      duration: duration

    anim.perform()
