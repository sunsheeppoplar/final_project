class FlashcardsController < ApplicationController
	protect_from_forgery with: :null_session

	def index
		@user = User.find(session[:user_id])
		@flashcards = @user.flashcards
		if @flashcards
			render :index
		else 
			render status: 400,
			nothing: true
		end
	end

	def new
		# so application.html.erb knows @user
		@user = User.find(session[:user_id])
		@user_id = User.find(session[:user_id])
		@flashcard = Flashcard.new

	end

	def create 
		Flashcard.create(flashcard_params)
		redirect_to(user_flashcards_path)
	end


	def show
		# so application.html.erb knows @user
		@user = User.find(session[:user_id])
		@flashcard = Flashcard.find(params[:id])
		if @flashcard
			render :show
		else 
			render status: 400,
			nothing: true
		end
	end

	def destroy
		Flashcard.find(params[:id]).destroy
		redirect_to(user_flashcards_path)
	end

	def search
	end

	private
	def flashcard_params
		params.require(:flashcard).permit(:chinese, :pinyin, :defin, :user_id)
	end

end