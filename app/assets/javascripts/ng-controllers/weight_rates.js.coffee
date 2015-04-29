AngularApp.controller "WeightRates", [
  "$state"
  "$rootScope"
  "$scope"
  "WeightRate"
  ($state, $rootScope, $scope, WeightRate) ->
    $rootScope.current_state_name = $state.current.name
    $scope.weight_rate = {}

    $scope.setCounter = (v) ->
      $scope.weight_rate.rate = v

    WeightRate.query((data)->
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
          name: "Weight level"
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
            text: "Resting Weight (Pound)"

    )

    $scope.saveMyWeightRate = () ->
      WeightRate.save $scope.weight_rate, (data) ->
        $state.go('app.layout.weight_rate_data')
 ]