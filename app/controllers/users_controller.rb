class UsersController < ApplicationController
 
before_action :logged_in_user, only: [:index, :edit, :update, :show]
before_action :correct_user, only: [:edit, :update]
before_action :admin_user, only: :destroy

	def show
		@user=User.find(params[:id])
		@micropost = current_user.micro_posts.build 
		@microposts = @user.micro_posts.paginate(page: params[:page], per_page: 5)
		
	end

	def index
		@users = User.where(activated: true).paginate(page: params[:page], :per_page=>15 )

	end

  def new
  	@user=User.new
  end

  def create
  	@user = User.new(params_req)


  	if @user.save
  		#UserMailer.account_activation(@user).deliver_now
  		#flash[:info] = "Check your email to activate your account to proceed further"
  		log_in @user
		redirect_to @user 
		else
			flash[:danger] = "Sorry something went wrong"
		render 'new'		
  	end
  end

  def edit
  	
  end


  def update
  	
  	if @user.update_attributes(params_req())
  		flash[:success] = "Updated successfully"
  		redirect_to @user
  	else
  		flash.now[:danger] = "Please correct the highlighted fields"
  		render 'edit'
  	end
  end

  def destroy
  		user = User.find(params[:id])
  		user.destroy
  		flash[:success] = "User #{user.name} Deleted"
  		redirect_to users_url
  end





private 
	
	def params_req
	params.require(:user).permit(:name, :email, :password, :password_confirmation)
end




def correct_user
	@user = User.find(params[:id])
	if(!current_user?(@user))
		flash[:danger] = "You are not permitted to do so"
	end
	redirect_to(root_url) unless current_user?(@user)
end

def admin_user
	redirect_to(root_url) unless current_user.admin?
end
	
end
