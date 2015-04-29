AngularApp.directive "resizable", ($window) ->
  (scope, element) ->
    w = undefined
    w = angular.element($window)
    scope.getWindowDimensions = ->
      h: w.height()
      w: w.width()

    scope.$watch scope.getWindowDimensions, ((newValue, oldValue) ->
      footerHeight = undefined
      windowHeight = undefined
      wrapperHeight = undefined
      scope.windowHeight = newValue.h
      scope.windowWidth = newValue.w
      windowHeight = newValue.h
      wrapperHeight = newValue.h - $(".footer").outerHeight()
      if $("footer").outerHeight() < 82
        footerHeight = 138
      else
        footerHeight = $("footer").outerHeight()
      $(".wrapper").css
        "padding-bottom": footerHeight
        "min-height": windowHeight

      $(".ie7 .wrapper").css
        "padding-bottom": footerHeight
        "min-height": wrapperHeight

    ), true
    w.bind "resize", ->
      scope.$apply()


AngularApp.directive "loading", ->
  restrict: "E"
  replace: true
  template: "<div class=\"loading\"> <div class=\"loaderimgText\" id=\"loaderimgText\"> <div><img src=\"/assets/ajax-loader.gif\" /></div> <div class=\"backTransparant\"></div> </div> </div>"
  link: (scope, element, attr) ->
    scope.$watch "loading", (val) ->
      if val
        $(element).show()
      else
        $(element).hide()
