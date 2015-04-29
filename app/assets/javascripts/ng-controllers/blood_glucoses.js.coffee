AngularApp.controller "BloodGlucoses", [
  "$state"
  "$rootScope"
  "$scope"
  "BloodGlucose"
  ($state, $rootScope, $scope, BloodGlucose) ->
    $rootScope.current_state_name = $state.current.name

    $scope.blood_glucose = {}

    $scope.setCounter = (v) ->
      $scope.blood_glucose.glucose = v

    BloodGlucose.query((data)->
      $scope.chartSeries = data.data

      $scope.chartConfig =
        options:
          chart:
            type: "line"

          plotOptions:
            series:
              stacking: ""
          legend:
            enabled: false
          exporting:
            enabled: false
        tooltip:
          style:
            padding: 10
            fontWeight: 'bold'

        series: [
          name: "Blood Glucose"
          data: $scope.chartSeries
        ]
        title:
          text: "Blood Glucose (Level)"

        loading: false
        size: {}
        xAxis:
          tickInterval: 1
          categories: data.dates
          title:
            text: "Date of measurement"

        yAxis:
          title:
            text: "Resting Blood/Glucose (Level)"

    )

    $scope.saveBloodGlucoseRate = () ->
      BloodGlucose.save $scope.blood_glucose, (data) ->
        $state.go('app.layout.blood_glucose_data')
 ]