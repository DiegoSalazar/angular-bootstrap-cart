App.controller 'CartController', ['$scope', 'Cart', ($scope, Cart) ->
  $scope.cart = Cart.query()
  $scope.cart.cart_items ?= []
  $scope.quantity = $scope.cart.cart_items.length
  $scope.empty = $scope.quantity == 0
  $scope.popover = {
    "content": "Hello Popover<br />This is a multiline message!",
    "saved": false
  }

  $scope.cartLinkText = ->
    'Cart ' + $scope.quantity

  $scope.addItem = (item)->
    cart_item = Cart.save(item)
    console.log(cart_item)
    $scope.cart.cart_items.push(cart_item)

  $scope.removeItem = (i)->
    console.log(i)

  popover_btn = $('a[bs-popover]')
  $scope.showPopver = ->
    stupidHack = -> # workaround for Angular's stupid "Error: $apply already in progress"
      popover_btn.popover('show')
    setTimeout stupidHack, 0
]