AngularApp.controller "App", [
  "$location"
  "$rootScope"
  "$scope"
  "HeartRate"
  ($location, $rootScope, $scope) ->
    $rootScope.location = $location

 ]