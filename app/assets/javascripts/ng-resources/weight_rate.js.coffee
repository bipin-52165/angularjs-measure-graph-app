'use strict'

AngularApp.factory "WeightRate", ($resource) ->
  $resource "/api/weight_rates/:id", {},
    query:
      isArray: false
