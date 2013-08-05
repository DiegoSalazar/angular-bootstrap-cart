class CartsController < ApplicationController
  before_filter :find_cart
  respond_to :json, :html

  def index
    respond_with @cart
  end

  def show
    respond_with @cart
  end

  def create
    respond_with @cart
  end

  def update
    respond_with Cart.update(params[:id], params[:cart])
  end

  def destroy
    respond_with Cart.destroy params[:id]
  end
  
end
