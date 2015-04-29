#
# Angular App
#

AngularApp.config [

  # DI

  # Providers
  "$httpProvider"
  "$logProvider"
  "$stateProvider"
  "$urlRouterProvider"
  (
    # Providers
    $httpProvider
    $logProvider
    $stateProvider
    $urlRouterProvider
  ) ->

    $urlRouterProvider.otherwise "/"

    $httpProvider.defaults.headers.common["X-CSRF-Token"] = $("meta[name=csrf-token]").attr("content")

    templatePath = "/assets/ng-templates/_"

    $stateProvider
      .state("app",
        abstract: true
        views   :
          app:
            controller : "App"
            templateUrl: templatePath + "app"
      )
      .state("app.layout",
        abstract: true
        views   :
          header:
            controller : "Header"
            templateUrl: templatePath + "header"
          views:
            templateUrl: templatePath + "views"
      )
      .state("app.layout.measure_heart_rate",
        url: "^/"
        views:
          "measure-heart-rate":
            controller : "HeartRates"
            templateUrl: templatePath + "measure-heart-rate"
      )
      .state("app.layout.heart_rate_data",
        url: "^/heart-rate-data"
        views:
          "heart-rate-data":
            controller : "HeartRates"
            templateUrl: templatePath + "heart-rate-data"
      )


      .state("app.layout.measure_weight_rate",
        url: "^/measure-weight-rate"
        views:
          "measure-weight-rate":
            controller : "WeightRates"
            templateUrl: templatePath + "measure-weight-rate"
      )
      .state("app.layout.weight_rate_data",
        url: "^/weight-rate-data"
        views:
          "weight-rate-data":
            controller : "WeightRates"
            templateUrl: templatePath + "weight-rate-data"
      )

      .state("app.layout.measure_blood_glucose",
        url: "^/measure-blood-glucose"
        views:
          "measure-blood-glucose":
            controller : "BloodGlucoses"
            templateUrl: templatePath + "measure-blood-glucose"
      )
      .state("app.layout.blood_glucose_data",
        url: "^/blood-glucose-data"
        views:
          "blood-glucose-data":
            controller : "BloodGlucoses"
            templateUrl: templatePath + "blood-glucose-data"
      )
]
.value "googleChartApiConfig",
  version: "1"
  optionalSettings:
    packages: [ "corechart", "gauge" ]
    language: "en"