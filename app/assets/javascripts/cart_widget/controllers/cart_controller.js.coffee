App.controller 'CartController', ['$scope', '$location', 'Cart', 'CartItem', ($scope, $location, Cart, CartItem)->
  # Initialize Cart
  if (cartId = $.cookie('cartId'))
    # The cartId will be the same as the Rails session[:cart_id]
    Cart.get { id: cartId }, (cart)->
      $scope.cart = cart
      console.log(cart)
      $scope.setCartItems()
  else # create a blank cart (Rails will save the cart_id to the session)
    cart = new Cart()
    cart.$save (c)->
      $scope.cart = c
      $.cookie 'cartId', c.id, { expires: endOfDay(), path: '/' }
      $scope.setCartItems()

  # The Add to cart button
  $scope.addItem = (item)->
    foundItem = null
    angular.forEach $scope.cart_items, (i)->
      foundItem = i if i.variant_id == item.variant_id

    if foundItem
      foundItem.quantity++
      CartItem.update
        id: foundItem.id
        cart_id: $scope.cart.id
        cart_item: foundItem
    else
      CartItem.save { cart_id: $scope.cart.id, cart_item: item }, (cart_item)->
        $scope.cart_items.push(cart_item)

  # The Up/Down cart item arrows
  $scope.updateItemQty = (i, amount)->
    cart_item = $scope.cart_items[i]
    cart_item.quantity += amount

    if cart_item.quantity <= 0
      $scope.removeItem i
    else
      CartItem.update
        id: cart_item.id
        cart_id: $scope.cart.id
        cart_item: cart_item

  # The X btn
  $scope.removeItem = (i)->
    cart_item = $scope.cart_items.splice(i, 1)[0]
    CartItem.remove
      id: cart_item.id
      cart_id: $scope.cart.id

  # What to show next to the cart icon in the nav
  $scope.cartLinkText = ->
    'Cart ' + $scope.cart_items?.length or 0

  # Used by the Add to Cart btn to show the popover when it's clicked
  popoverBtn = $('a[bs-popover]')
  $scope.showPopover = ->
    stupidHack = -> # workaround for Angular's stupid "Error: $apply already in progress"
      popoverBtn.popover('show')
    setTimeout stupidHack, 0

  $scope.cartEmpty = ->
    $scope.cart_items?.length == 0

  $scope.setCartItems = ->
    $scope.cart_items = $scope.cart.cart_items or []
    $scope.quantity = $scope.cart_items.length

  $scope.cartTotal = ->
    total = 0.0
    angular.forEach $scope.cart_items, (i)->
      total += parseFloat(i.quantity) * parseFloat(i.price)
    total

  $scope.itemQtyIsOne = (i)->
    $scope.cart_items[i].quantity == 1
]

# Helpers

endOfDay = ->
  new Date((new Date()).setHours(23,59,59,999))
