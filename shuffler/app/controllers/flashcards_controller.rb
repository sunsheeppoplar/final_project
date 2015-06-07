class FlashcardsController < ApplicationController
	protect_from_forgery with: :null_session

	def new
		@flashcard = Flashcard.new
	end

	def create 
		Flashcard.create(flashcard_params)
		redirect_to(user_flashcards_path)
	end

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

	def show
		@flashcard = Flashcard.find(params[:id])
		if @flashcard
			render :show
		else 
			render status: 400,
			nothing: true
		end
	end

	private
	def flashcard_params
		params.require(:flashcard).permit(:chinese, :pinyin, :defin, :user_id)
	end

end