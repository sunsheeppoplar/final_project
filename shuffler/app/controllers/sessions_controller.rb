class SessionsController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :authenticate, only: [:destroy]

	#new session login
	def new		
		render :new		
	end

	# starts a new user session
	def create 
		user = User.find_by({email: params[:email]})
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			redirect_to user_flashcards_path
		else 
			@email = params[:email]
			flash.now[:error] = "Sorry, unknown combo! Try again, please!"
			render :new
		end
	end

	# destroy session on logout
	def destroy
		reset_session
		redirect_to new_session_path
	end
end