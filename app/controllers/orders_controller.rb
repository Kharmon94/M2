class OrdersController < ApplicationController
  before_action :set_cart
  before_action :set_line_item


  def index
  end

  def create
	  @order = Order.new(order_params)
	  @cart.line_items.each do |item|
	    @order.line_items << item
	    item.cart_id = nil
	  end
	  @order.save
	  Cart.destroy(session[:cart_id])
	  session[:cart_id] = nil
	  redirect_to root_path
  end

  def show
  end

  def new
  end

  private

  	def set_cart
  	  	@cart = Cart.find(session[:cart_id])
  	end

  	def set_line_item
  		@line_item = LineItem.find(params[:id])
  	end

	def order_params
	    params.require(:order).permit(:first_name, :last_name, :email, :street_address, :city, :zip_code)
	end


end
