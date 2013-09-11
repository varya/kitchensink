document.addEventListener "deviceready", ->
  angular.bootstrap document, ['cameraApp']

cameraApp = angular.module 'cameraApp', ['hmTouchevents']

cameraApp.controller 'IndexCtrl', ($scope)->

  # Native UI
  steroids.view.navigationBar.show "Camera"

  # Camera options

  $scope.imageSrc = null

  $scope.cameraOptions =
    fromPhotoLibrary:
      quality: 100
      destinationType: navigator.camera.DestinationType.DATA_URL
      sourceType: navigator.camera.PictureSourceType.PHOTOLIBRARY
      correctOrientation: true # Let Cordova correct the picture orientation (WebViews don't read EXIF data properly)
      targetWidth: 600
      popoverOptions: # iPad camera roll popover position
        width: 768
        height: 190
        arrowDir: Camera.PopoverArrowDirection.ARROW_UP

    fromCamera:
      quality: 100
      destinationType: navigator.camera.DestinationType.DATA_URL
      correctOrientation: true
      targetWidth: 600

  # Show the selected image
  imageUriReceived = (imageURI)->
    $scope.imageSrc = "data:image/jpeg;base64," + imageURI # use Base64 URL because Cordova doesn't play nice with localhost
    $scope.showSpinner = false
    $scope.$apply()

  # Camera failure callback
  cameraError = (message)->
    navigator.notification.alert 'Cordova says: ' + message, null, 'Capturing the photo failed!'
    $scope.showSpinner = false
    $scope.$apply()

  # Take a photo using the device's camera with given options
  $scope.getPicture = (options)->
    navigator.camera.getPicture imageUriReceived, cameraError, options
    $scope.showSpinner = true
    $scope.$apply()

