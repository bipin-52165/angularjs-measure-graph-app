AngularApp.controller "Footer", [
  "$location"
  "$rootScope"
  "$scope"
  "HeartRate"
  ($location, $rootScope, $scope) ->
    $rootScope.location = $location

 ]