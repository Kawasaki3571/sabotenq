class QuestionListsController < ApplicationController
	before_action :authenticate_user!
	before_action :answear_params
	before_action :answear_count, only: [:show]
	before_action :current_user_answear, only: [:show]
	before_action :current_user_answear_count, only: [:show]
	before_action :answear_all, only: [:show]

	def index
		@questions = Question.all
	end
	def show
		@question = Question.find(params[:id])
		# @answear = current_user.answears.new(post_comment_params)
		@answear = Answear.new
		@a_count
		@current_user_answear
	end

	def new
		@answear = Answear.new
	end

	def create
    	question = Question.find(params[:id])
		answear = current_user.answears.new(answear_params)
		answear.question_id = question.id
    	answear.save
    	redirect_to question_list_path
  	end
  	# :question_list_id

  	def edit
  		question = Question.find(params[:id])
  		answears_q = current_user.answears.all
  		@answear = answears_q.where(question_id: question.id).first
  	end

  	def update_answear
  		question = Question.find(params[:id])
  		answears_q = current_user.answears.all
  		answear = answears_q.where(question_id: question.id).first
  		answear.update(answear_params)
  		redirect_to question_list_path
  	end

  	def update
    	question = Question.find(params[:id])
    	answear = current_user.answears.where(question_id: question.id).first
    	answear.update(blog_params)
    	redirect_to question_lists_path
	end

		private

	def post_comment_params
		params.fetch(:answear,{}).permit(:answear_text, :final_answear, :user_id)
		params.fetch(:question, {}).permit(:title, :explain)
	end

	def answear_params
		params.fetch(:answear,{}).permit(:user_id,:question_id,:answear_text, :final_answear)
		# params.fetch(:question, {}).permit(:title, :explain)
	end

	def answear_count
		question = Question.find(params[:id])
		a_count = question.answears.length.to_i
		@a_count = a_count
	end

	def current_user_answear
		@current_user_answears = current_user.answears.where(question_id: params[:id]).all
	end

	def current_user_answear_count
		question = Question.find(params[:id])
		cuacarray = question.answears.where(user_id: current_user.id).all
		@current_user_answear_count = cuacarray.length
	end
	def answear_all
		question = Question.find(params[:id])
		@answear_all = question.answears.all
	end

end

