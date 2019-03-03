class SessionsController < ApplicationController
  def new
  	
  end
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		#if user.activated?
  			log_in user


  	if params[:session][:remember_me] == '1'
  		remember user
  	else
  		forget user
  	end
  		forwarding_to_stored_url user
  		#
  		#else
  			#message = "Account not activated"
  			#message += " check your email to activate your account"
  			#flash[:warning] = message
  			#redirect_to root_url
  		#end
  		
  		else
  			flash.now[:danger] = "invalid email/password combination"
  			render 'new'
  	end
  	
  end
  def destroy
  	log_out if logged_in?
  	redirect_to root_url
  	flash[:success] = "logged out"
  end
end
