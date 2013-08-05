class CartItemsController < ApplicationController
  before_filter :find_cart
  respond_to :json

  def create
    cart_item = @cart.cart_items.create cart_item_params
    respond_with @cart, cart_item
  end

  def update
    cart_item = @cart.cart_items.find params[:id]
    cart_item.update quantity: cart_item_params[:quantity].to_i
    respond_with @cart, cart_item
  end

  def destroy
    cart_item = @cart.cart_items.find params[:id]
    cart_item.soft_delete!
    respond_with cart_item
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:variant_id, :quantity)
  end
end
