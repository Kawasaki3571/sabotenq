class RootController < ApplicationController
	def top
		@questions = Question.all
		@user_count = User.all.count
	end

	def show
		redirect_to "/top"
	end
	def index
		@questions = Question.all
	end
	def about_us
	end

	def rule
	end
end
