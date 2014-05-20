# For an explanation of the steroids.config properties, see the guide at
# http://guides.appgyver.com/steroids/guides/project_configuration/config-application-coffee/

steroids.config.name = "Steroids Kitchensink"

# -- Initial Location --
steroids.config.location = "http://localhost/views/example/index.html"

# -- Tab Bar --
# Credits:
# Icons are taken free from IconBeast Lite
# http://www.iconbeast.com

#steroids.config.tabBar.enabled = true
#steroids.config.tabBar.tabs = [
#  {
#    title: "Index"
#    icon: "vendor/iconbeast/home.png"
#    location: "http://localhost/views/example/index.html"
#  },
#  {
#    title: "Settings"
#    icon: "vendor/iconbeast/gear.png"
#    location: "http://localhost/views/settings/index.html"
#  }
#]

# steroids.config.tabBar.tintColor = "#000000"
# steroids.config.tabBar.tabTitleColor = "#00aeef"
# steroids.config.tabBar.selectedTabTintColor = "#ffffff"
# steroids.config.tabBar.selectedTabBackgroundImage = "icons/pill@2x.png"

# steroids.config.tabBar.backgroundImage = ""
#

#steroids.config.preloads = [
#  {
#    id: "rightDrawer"
#    location: "http://localhost/views/settings/index.html"
#  }
#]

# -- Drawers
steroids.config.drawers =
  right:
    id: "rightDrawer"
    location: "http://localhost/views/side-menu/index.html"
    showOnAppLoad: false
    widthOfDrawerInPixels: 100
  options:
    centerViewInteractionMode: "Full"
    closeGestures: ["PanNavBar", "PanCenterView", "TapCenterView"]
    openGestures: ["PanNavBar", "PanCenterView"]
    showShadow: true
    stretchDrawer: true
    widthOfLayerInPixels: 0


# -- Navigation Bar --
steroids.config.navigationBar.tintColor = "#00aeef"
steroids.config.navigationBar.titleColor = "#ffffff"
steroids.config.navigationBar.buttonTintColor = "#ffffff"

# steroids.config.navigationBar.landscape.backgroundImage = ""
# steroids.config.navigationBar.portrait.backgroundImage = ""

# -- Android Loading Screen
steroids.config.loadingScreen.tintColor = "#262626"

# -- iOS Status Bar --
steroids.config.statusBar.enabled = true
steroids.config.statusBar.style = "default"

# -- File Watcher --
# steroids.config.watch.exclude = ["www/my_excluded_file.js", "www/my_excluded_dir"]

# -- Pre- and Post-Make hooks --
# steroids.config.hooks.preMake.cmd = "echo"
# steroids.config.hooks.preMake.args = ["running yeoman"]
# steroids.config.hooks.postMake.cmd = "echo"
# steroids.config.hooks.postMake.args = ["cleaning up files"]

# -- Default Editor --
# steroids.config.editor.cmd = "subl"
# steroids.config.editor.args = ["."]
