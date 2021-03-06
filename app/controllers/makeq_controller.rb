class MakeqController < ApplicationController
	  before_action :post_params
    before_action :authenticate_user!
    before_action :authenticate_admin_user!
  def index
  	@questions = Question.all
  end

  def edit
  	@question = Question.find(params[:id])
  end

  def destroy
  		question = Question.find(params[:id])
        question.destroy
        redirect_to '/makeq'
  end
  def show
    @question = Question.find(params[:id])
    @answears = Answear.where(question_id: params[:id]).all
  end

  def create
    question = Question.new(post_params)
    question.save
    redirect_to '/makeq'
  end


  def new
    @question = Question.new
  end

  def update
  	question = Question.find(params[:id])
    question.update(post_params)
    redirect_to '/makeq'
  end

      private
 
    def post_params
          params.fetch(:question, {}).permit(:title, :explain, :koukai)
    end
end
