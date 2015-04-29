'use strict'

AngularApp.factory "BloodGlucose", ($resource) ->
  $resource "/api/blood_glucoses/:id", {},
    query:
      isArray: false
