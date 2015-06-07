class UsersController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :authenticate, except: [:create]

	def show
		id = params[:id] || session[:user_id]
		@user = User.find(id)
		respond_to do |format|
			format.html { render :show}
		end
	end

	def create
		@user = User.new(f_name: params[:f_name], l_name: params[:l_name], email: params[:email], password: params[:password])
		if @user.save
			session[:user_id] = @user.id 
			session[:name] = @user.f_name
			flash[:success] = "Welcome, #{@user.f_name}."
			redirect_to user_path
		else
			flash.now[:error] = "Try again, please!"
			redirect_to new_session_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :f_name, :l_name, :password)
	end

end