# Information on using the integrated Facebook Connect plugin
#   http://guides.appgyver.com/steroids/guides/phonegap_on_steroids/facebook-connect-plugin

document.addEventListener "deviceready", ->
  angular.bootstrap document, ['facebookApp']

facebookApp = angular.module 'facebookApp', ['hmTouchevents']

facebookApp.controller 'PluginCtrl', ($scope)->

  # Change $scope.appId to match your Facebook App's ID
  # Build Service iOS Config Page's "Facebook URL Protocol" field must match this ID, in the format
  #   fb167554586768574

  $scope.appId = "167554586768574"

  # window.plugins.facebookConnect.initWithAppId $scope.appId, (response)->
  #   alert("facebookConnect.initWithAppId:" + JSON.stringify(result))

  $scope.login = ->
    window.plugins.facebookConnect.login {permissions: ["email", "user_about_me"], appId: $scope.appId}, (result)->
      alert("facebookConnect.login:" + JSON.stringify(result))

  $scope.requestWithGraphPath = ->
    window.plugins.facebookConnect.requestWithGraphPath "/me/friends", (result)->
      alert("facebookConnect.requestWithGraphPath:" + JSON.stringify(result))

  $scope.logout = ->
    window.plugins.facebookConnect.logout (result)->
      alert("facebookConnect.logout:" + JSON.stringify(result))


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