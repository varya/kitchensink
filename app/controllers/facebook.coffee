# Information on using the integrated Facebook Connect plugin
#   http://guides.appgyver.com/steroids/guides/phonegap_on_steroids/facebook-connect-plugin

document.addEventListener "deviceready", ->
  angular.bootstrap document, ['facebookApp']

facebookApp = angular.module 'facebookApp', ['hmTouchevents']

facebookApp.controller 'PluginCtrl', ($scope)->

  steroids.view.navigationBar.show "Facebook"

  # Set $scope.appId below and the "Facebook URL Protocol" field in Build Service iOS Config Page to match your Facebook App ID, in the format
  #   167554586768574
  # Then, build a custom Scanner app and use it to scan the Kitchensink project.
  # For more information, see the guide at
  # http://guides.appgyver.com/steroids/guides/phonegap_on_steroids/facebook-connect-plugin/

  $scope.appId = 167554586768574
  $scope.facebookLoginStatus = "FB not initialized"

  # Initialize Facebook, subscribe to various events
  $scope.facebookInit = ->
    FB.init
      appId: $scope.appId
      nativeInterface: CDV.FB
      useCachedDialogs: false

    $scope.facebookInitialized = true
    $scope.getFacebookLoginStatus()

  $scope.getFacebookLoginStatus = ->
    FB.getLoginStatus (response)->
      if response.status is 'connected'
        uid = response.authResponse.userID
        accessToken = response.authResponse.accessToken
        $scope.facebookLoginStatus = "Logged in"
      else if response.status is 'not_authorized'
        $scope.facebookLoginStatus = "App not authorized"
      else
        $scope.facebookLoginStatus = "Not logged in"
      $scope.$apply()

  $scope.facebookLogin = ->
    if $scope.facebookLoginStatus is "Logged in"
      alert "Already logged in!"
    else
      FB.login(
        (response)->
          if (response.authResponse)
            FB.api '/me', (response)->
              alert "Good to see you, " + response.name + "."
          else
            alert "User cancelled login or did not fully authorize."
          $scope.getFacebookLoginStatus()
        , { scope: "email" }
      )

  $scope.facebookFetch = ->
    FB.api(
      '/me/friends'
      { fields: 'id, name, picture' }
      (response)->
        if response.error
          alert "Error! \n\n" + JSON.stringify(response.error)
        else
          alert JSON.stringify(response.data)
    )

  $scope.facebookDialog = ->
    params =
      method: 'feed'
      name: 'Facebook Dialogs'
      link: 'https://developers.facebook.com/docs/reference/dialogs/'
      picture: 'http://fbrell.com/f8.jpg'
      caption: 'Reference Documentation'
      description: 'Dialogs provide a simple, consistent interface for applications to interface with users.'

    FB.ui params, (obj)->
      alert "Dialog response: " + JSON.stringify(obj)

  $scope.facebookLogout = ->
    FB.logout (response)->
      alert 'Logged out: ' + JSON.stringify(response)
      $scope.getFacebookLoginStatus()



# Experimental, doesn't function properly
facebookApp.controller 'WebCtrl', ($scope)->

  $scope.login = ->
    FB.login (response)->
      alert "FB.login:" + JSON.stringify(response)
      location.reload()

  $scope.logout = ->
    FB.logout (response)->
      alert "FB.logout:" + JSON.stringify(response)

  $scope.queryName = ->
    FB.api '/me', (response)->
      alert 'Your name is ' + response.name