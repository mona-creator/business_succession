class FavoritesController < ApplicationController
def create
            company = Company.find(params[:company_id])
            favorite = current_user.favorites.new(company_id: company.id)
            favorite.save
            redirect_to request.referrer || root_url
        end
        def destroy
            company = Company.find(params[:company_id])
            favorite = current_user.favorites.find_by(company_id: company.id)
            favorite.destroy
            redirect_to request.referrer || root_url
        end
end
