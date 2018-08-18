class RootController < ApplicationController
	def top
		@questions = Question.all
	end

	def index
		@questions = Question.all
	end
end
