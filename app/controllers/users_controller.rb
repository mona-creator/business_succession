class UsersController < ApplicationController
    before_action :authenticate_user!

	def show
        @user = User.find(params[:id])
        @companies = Company.all
	end

	def edit
        @user = User.find(params[:id])
        if @user != current_user
          redirect_to user_path(current_user)
        end
	end

	def update
        @user = User.find(params[:id])
    	if @user.update(user_params)
    	  redirect_to user_path, notice: "successfully updated user!"
        else
          render "edit"
        end
	end

    private
    def user_params
       params.require(:user).permit(:surname, :first_name, :surname_kana, :first_name_kana,
                                  :postal_code, :address, :phone_number, :email)
    end

end
