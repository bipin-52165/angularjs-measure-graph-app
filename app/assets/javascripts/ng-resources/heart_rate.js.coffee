'use strict'

AngularApp.factory "HeartRate", ($resource) ->
  $resource "/api/heart_rates/:id", {},
    query:
      isArray: false
