AngularApp.controller "Header", [
  "$location"
  "$rootScope"
  "$scope"
  "HeartRate"
  ($location, $rootScope, $scope) ->
    $rootScope.location = $location

 ]