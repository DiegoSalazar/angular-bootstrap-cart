App.controller 'CartController', ['$scope', 'Cart', ($scope, Cart) ->
  popover = $('a[bs-popover]')

  $scope.showPopver = ->
    stupidHack = ->
      popover.popover('show')
    setTimeout stupidHack, 0

  # $scope.cart = Cart.query()
  $scope.cart = {
    cart_items: [
      { name: 'Product 1 - red' }
    ]
  }
  $scope.quantity = $scope.cart.cart_items.length
  $scope.empty = $scope.quantity == 0
  $scope.popover = {
    "content": "Hello Popover<br />This is a multiline message!",
    "saved": false
  }

  $scope.cartLinkText = ->
    'Cart ' + $scope.quantity

  # $scope.newCartItem1
  $scope.addItem = (a)->
    $scope.cart.cart_items.push(a)
]