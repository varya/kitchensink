# NOTE: the correct plugin tag in www/config.ios.xml is
#   <plugin name="com.cordova.barcodeScanner" value="CDVBarcodeScanner" />
#
# Make sure it is correct!

barcodeApp = angular.module "barcodeApp", ["hmTouchevents"]

barcodeApp.controller "IndexCtrl", ($scope)->
  steroids.view.navigationBar.show("Barcode Scanner")

  # Create navigation bar button
  navButton = new steroids.buttons.NavigationBarButton()
  navButton.title = "Scan"
  navButton.onTap = ->
    scan()

  # Assign the button to the navigation bar
  steroids.view.navigationBar.update
    right: [navButton]

  # Prompts the user to scan a barcode. Called when the user
  # clicks the right navigation bar button.

  scan = ->
    scanner = cordova.plugins.barcodeScanner

    scanner.scan (result)->
      label = document.getElementById "barcode"

      if result.cancelled
        label.innerHTML = "Scan cancelled."
      else
        label.innerHTML = "(#{result.format}) #{result.text}"

  # NOTE: If you want to open a modal after scanning has completed, you need
  # to currently set a timeout. This is because the scanner operates in its own
  # type of modal and hasn't completely closed yet when this function has
  # been reached. 1000ms seems to work consistently.
  #
  # Example:
  #

  # setTimeout(
  #   ->
  #     steroids.modal.show(
  #       view: NEW_MODAL_VIEW,
  #       {onSuccess: ->
  #         # Send message to new modal
  #         window.postMessage(
  #           scanned:
  #             format:   result.format,
  #             content:  result.text
  #           "newmodal.html"
  #         )
  #       }
  #     )
  #   1000
  # )
