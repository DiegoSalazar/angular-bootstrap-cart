class CartsController < ApplicationController
  before_filter :find_cart
  respond_to :json

  def index
    respond_with @cart
  end

  def show
    respond_with @cart
  end

  def create
    @cart.cart_items.create params[:cart_item]
    respond_with cart
  end

  def update
    respond_with Cart.update(params[:id], params[:cart])
  end

  def destroy
    respond_with Cart.destroy params[:id]
  end

  private

  def find_cart
    @cart ||= session[:cart_id].present? ? Cart.find(session[:cart_id]) : Cart.new
    @cart.tap { |c| (c.save; session[:cart_id] = c.id) if c.new_record? }
  end
end
