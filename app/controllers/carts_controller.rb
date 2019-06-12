class CartsController < InheritedResources::Base
	rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
  

	def destroy
		@cart.destroy if @cart.id == session[:cart_id]
		session[:cart_id] = nil
		respond_to do |format|
			format.html { redirect_to products_path, notice: "Cart was successfully destroyed"}
			format.json { head :no_content }
		end
	end

  private

    def cart_params
      params.require(:cart).permit()
    end

    def invalid_cart
    	logger.error "Attempt to access invalid cart #{params[:id]}"
    	redirect_to products_path, notice: "That cart does not exist"
    end
end

