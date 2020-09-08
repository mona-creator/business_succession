class FavoritesController < ApplicationController
  def create
    @company = Company.find(params[:company_id])
    favorite = current_user.favorites.build(company_id: params[:company_id])
    favorite.save
      end

  def destroy
    @company = Company.find(params[:company_id])
    favorite = Favorite.find_by(company_id: params[:company_id], user_id: current_user.id)
    favorite.destroy
  end
end
