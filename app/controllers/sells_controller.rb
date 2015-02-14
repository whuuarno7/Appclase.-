class SellsController < ApplicationController
	def index
	@sells = Sell.all
	end
	def show
	@sells = Sell.find(params[:id])
	end
end
