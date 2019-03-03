class MicroPostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

before_action :correct_user, only: :destroy

def create
	@micropost = current_user.micro_posts.build(req_params)
	
	if @micropost.save
		flash[:success] = "Post created"
		redirect_to root_url

	else
		@feed_items = []
		render 'pages/home'

	end
	
end

def destroy
	@micropost.destroy
	flash[:success] = "Post created on #{@micropost.created_at} deleted"
	redirect_to request.referrer || root_url
end



private

def req_params
	params.require(:micro_post).permit(:content, :picture)
end

def correct_user
	@micropost = current_user.micro_posts.find_by(id: params[:id])
	redirect_to root_url if @micropost.nil?
end





end
