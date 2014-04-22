animationApp = angular.module 'animationApp', ['ngTouch']

animationApp.controller 'IndexCtrl', ($scope)->

  steroids.view.navigationBar.show "Animation"

  $scope.performAnimation = (transition, duration)->

    anim = new steroids.Animation
      transition: transition
      duration: duration

    anim.perform()
