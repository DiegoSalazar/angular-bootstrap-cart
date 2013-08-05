class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def find_cart
    has_cart = session[:cart_id].present? && Cart.exists?(session[:cart_id])
    @cart ||= has_cart ? Cart.find(session[:cart_id]) : Cart.new
    @cart.tap { |c| (c.save; session[:cart_id] = c.id) if c.new_record? }
  end
end
