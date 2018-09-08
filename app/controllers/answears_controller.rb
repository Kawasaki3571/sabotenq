class AnswearsController < ApplicationController
    before_action :authenticate_user!
    before_action :answear_params
    before_action :replies_all
    def new
    end

    def index
    end

    def show
        @answear = Answear.find(params[:answear_id])
        answear = @answear
        @question = Question.where(id: answear.question_id).first
        @reply = Reply.new
    end

    def create
    	question = Question.find(params[:question_list_id])
    	answear = current_user.answear.new(answear_params)
		answear.question_list_id = question.id
    	answear.save
    	redirect_to question_lists_path
	end

        private

	def answear_params
		params.fetch(:answears,{}).permit(:user_id,:question_id,:answear_text, :final_answear)
		# params.fetch(:question, {}).permit(:title, :explain)
	end
    def replies_all
        answear = Answear.find(params[:answear_id])
        @replies = Reply.where(answear_id: answear.id)
        # @replies.each do |rep|
        #     rep.user_name = User.where(id: rep.user_id)
        # end
    end

end