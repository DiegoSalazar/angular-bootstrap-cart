window.App = angular.module('CartWidget', ['ngResource', '$strap.directives'])

App.config ["$httpProvider", (p)->
  p.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

App.factory "Cart", ['$resource', ($resource) ->
  $resource '/carts/:id', { id: '@id' }, { update: { method: 'PUT' }}
]

App.factory "CartItem", ['$resource', ($resource) ->
  $resource '/carts/:cart_id/cart_items/:id', { cart_id: '@cart_id', id: '@id' }, { update: { method: 'PUT' }}
]