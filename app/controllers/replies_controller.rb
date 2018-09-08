class RepliesController < ApplicationController
	before_action :reply_params
	before_action :replies_all
	def create
	    answear = Answear.find(params[:answear_id])
    	reply = current_user.replies.new(reply_params)
    	reply.answear_id = answear.id
    	reply.save
    	redirect_to answears_kobetsu_path
	end

private
	def reply_params
  	params.fetch(:reply, {}).permit(:user_id,:answear_id,:comment)
	end
	def replies_all
		answear = Answear.find(params[:answear_id])
		@replies = Reply.where(answear_id: answear.id)
	end
end
