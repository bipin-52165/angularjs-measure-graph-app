AngularApp.controller "HeartRates", [
  "$state"
  "$rootScope"
  "$scope"
  "HeartRate"
  ($state, $rootScope, $scope, HeartRate) ->
    $rootScope.current_state_name = $state.current.name
    $scope.heart_rate = {}
    $scope.activeData = 
      labels: []
      datasets: [
        data: []
       ]

    $scope.setCounter = (v) ->
      $scope.heart_rate.rate = v

    HeartRate.query((data)->
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
          name: "Heart Rates"
          data: $scope.chartSeries
        ]
        title:
          text: null

        loading: false
        size: {}
        xAxis:
          tickInterval: 1
          categories: data.dates
          title:
            text: "Date of measurement"

        yAxis:
          title:
            text: "Resting HR(beats/10 seconds)"

    )

    $scope.saveMyHeartRate = () ->
      HeartRate.save $scope.heart_rate, (data) ->
        $state.go('app.layout.heart_rate_data')
 ]