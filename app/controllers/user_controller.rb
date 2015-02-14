class UserController < ApplicationController
  def index
  	@user = User.all
  	puts "#{@user.inspect}"
  end
end
