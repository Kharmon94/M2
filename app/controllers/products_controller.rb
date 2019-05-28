class ProductsController < InheritedResources::Base

	def index
	    @products = Product.all
	    @order_item = current_order.order_items.new
	end

  private

    def product_params
      params.require(:product).permit(:title, :description, :price)
    end
end

