class UsersController < ApplicationController
  before_action :authenticate_user!
	before_action :contribution_count, only: [:show]
	before_action :user_params
  def show
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path
  end


  private
    def user_params
          params.fetch(:user, {}).permit(:user_name)
    end



  def contribution_count
  	user = User.find(params[:id])
  	answear_count = user.answears.count.to_i
  	favorites_count = 0
  	user.answears.each do |ans|
  		favorites_count = favorites_count + ans.favorites.count.to_i
  	end
  	@count = answear_count*5 + favorites_count
  end
end
