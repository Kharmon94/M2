class ChargesController < ApplicationController
	 before_action :set_item
	 before_action :set_cart

	def new
	end

	def create
	  # Amount in cents
	  @amount = (@cart.total_price.to_i * 100)

	  customer = Stripe::Customer.create({
	    email: params[:stripeEmail],
	    source: params[:stripeToken],
	  })

	  charge = Stripe::Charge.create({
	    customer: customer.id,
	    amount: @amount,
	    description: "#{@cart.line_items.title} - #{@cart.line_items.quantity}",
	    currency: 'usd',
	  })

		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to show_cart_path
	end

	private

	def set_item
	  @product = Product.find_by_id(params[:id])
	end

	def set_cart
	  @cart = Cart.find(session[:cart_id])
	end


end
