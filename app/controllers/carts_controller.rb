class CartsController < ApplicationController
  respond_to :json

  def index
    respond_with Cart.all
  end

  def show
    respond_with Cart.find params[:id]
  end

  def create
    respond_with Cart.create params[:cart]
  end

  def update
    respond_with Cart.update(params[:id], params[:cart])
  end

  def destroy
    respond_with Cart.destroy params[:id]
  end
end
