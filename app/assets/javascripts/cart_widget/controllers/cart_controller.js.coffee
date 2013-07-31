App.controller 'CartController', ['$scope', 'Cart', ($scope, Cart) ->
  $scope.cart = Cart.query()
  $scope.cart_items = $scope.cart.cart_items or []
  $scope.quantity = $scope.cart_items.length
  
  $scope.popover = {
    "content": "Hello Popover<br />This is a multiline message!",
    "saved": false
  }

  $scope.cartLinkText = ->
    'Cart ' + $scope.quantity

  $scope.addItem = (item)->
    cart_item = Cart.save({ cart_item: item })
    $scope.cart_items.push(item)

  $scope.removeItem = (i)->
    $scope.cart_items.splice(i, 1)

  popover_btn = $('a[bs-popover]')
  $scope.showPopover = ->
    stupidHack = -> # workaround for Angular's stupid "Error: $apply already in progress"
      popover_btn.popover('show')
    setTimeout stupidHack, 0

  $scope.cartEmpty = ->
    $scope.cart_items.length == 0
]