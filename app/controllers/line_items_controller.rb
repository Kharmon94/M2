class LineItemsController < InheritedResources::Base
	include CurrentCart
	before_action :set_line_item, only: [:show, :edit, :update, :destroy]
	before_action :set_cart, only: [:create]



	def create
		product = Product.find(params[:product_id])
		@line_item = @cart.add_product(product)

		respond_to do |format|
			if @line_item.save
				format.html { redirect_to @line_item.cart, notice: 'Item added to cart.'}
				format.json { render :show, status: :created, location: @line_item }
			else
				format.html { render :new }
				format.json { render json: @line_item.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@cart = Cart.find(session[:cart_id])
		@line_item.destroy
		respond_to do |format|
			format.html { redirect_to products_path, notice: "Item removed from cart."}
			format.json { head :no_content }
		end
	end

  private

  	def set_line_item
  		@line_item = LineItem.find(params[:id])
  	end

    def line_item_params
      params.require(:line_item).permit(:product_id)
    end
end

