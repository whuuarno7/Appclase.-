class ClientsController < ApplicationController

before_action :load_client, only: [:show,:edit,:update, :destroy]
  def index
  	@clients = Client.all 
  	#puts "#{clients.inspect}"
  end
  	def show
  		#@clients = Client.find(params[:id])
  	end

    def new
    	@client = Client.new 
    end

    def create 
    	params_filtered = params.require(:client).permit(:name,:email,:password)
    	@client = Client.new(params_filtered)
    
      	if @client.save
      		redirect_to clients_path
      	else
          render 'new' #render es comando para halar la vista en html
      
      	end
      end
    def edit 
        #@client = Client.find(params[:id])
    end
    def update 
     # @client = Client.find(params[:id]) #Los corchetes corresponden al número de find y params [:id] es el número del parametro
      params_filtered = params.require(:client).permit(:name, :email)
      
      if @client.update(params_filtered)
        redirect_to clients_path
    else 
      render 'edit' #redireccioneme a esta palntilla
    end 
  end
  def destroy 
   # @client = Client.find(params[:id])
    @client.destroy 
    redirect_to clients_path,
    notice: 'Usuario eliminado'

  end
  def load_client
    begin
      @client = Client.find(params[:id])
    rescue ActiveRecord::recordNotFound => e
      redirect_to clients_path,
      notice: 'El usuario no está resgitrado en la base de datos'
    end
  end
def login 
    @client = Client.new

   end

   def do_login 
    params_filtered = params.require(:client).permit(:email, :password)
    @client = Client.new(params_filtered)
    client_fetch = @client.login
    if @client.client_fetch
    session[:client_id] = client_field.id
    redirect_to products_path, notice: 'bienvenido a esto' 
    else
      flash[:error] = 'error al autenticarse'
      render 'login'
    end 
  end

  def logout
    session[:client_id] = nil 
    redirect_to login_users_path, notice: 'Se fue? Bueno. Buenas energías'
  end
end

