class ProductsController < ApplicationController


  before_action :login_required
  def index
  	@products = Product.all
  end

  def new
  	@products =Product.new
  end

  def show
  	@products= Product.find(params[:id])

  end

   def create 
    	params_filtered = params.require(:product).permit(:name,:ref, :price, :quantity, :size, :brand, :description, :color)
    	@product = Product.new(params_filtered)
    
      	if @product.save
      		redirect_to products_path
      	else
          render 'new' #render es comando para halar la vista en html
      	end
    end  
  def edit
      @product = Product.find(params[:id]) 	
  end

  def update 
      @product = Product.update(params[:id])
      params_filtered = params.require(:product).permit(:quantity, :description)

      if @client.update(params_filtered)
        redirect_to clients_path
      else 
        render 'edit'
      end
  end

  def destroy
    @product = Product.find(paramas[:id])
    @product.destroid
    redirect_to products_path,
  notice: 'El producto ha sido eliminado de su inventario'



end
