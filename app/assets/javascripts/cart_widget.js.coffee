window.App = angular.module('CartWidget', ['ngResource', '$strap.directives'])

App.config ["$httpProvider", (p)->
  p.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

App.factory "Cart", ['$resource', ($resource) ->
  $resource '/carts/:id', { id: '@id' }, { update: { method: 'PUT' }}
]