window.App = angular.module('CartWidget', ['ngResource', '$strap.directives'])

window.App.factory "Cart", ['$resource', ($resource) ->
  $resource '/carts/:id', { id: '@id' }, { update: { method: 'PUT' }}
]