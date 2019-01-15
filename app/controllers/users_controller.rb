class UsersController < ApplicationController
 
	def show
		@user=User.find(params[:id])
	end

  def new
  	@user=User.new
  end

  def create
  	@user = User.new(params_req)
  	if @user.save
  		log_in @user
  		flash[:success] = "Thanks for signing up"
		redirect_to @user 
		else
			flash[:danger] = "Sorry something went wrong"
		render 'new'		
  	end
  end








private 
	
	def params_req
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
	
end
