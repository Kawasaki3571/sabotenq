class FavoritesController < ApplicationController
	def create
		answear = Answear.find(params[:answear_id])
		favorite = current_user.favorites.new(answear_id: answear.id)
		favorite.save
		redirect_to answears_kobetsu_path
	end
	def destroy
       answear = Answear.find(params[:answear_id])
       favorite = current_user.favorites.find_by(answear_id: params[:answear_id])
       favorite.destroy
       redirect_to answears_kobetsu_path
	end
end