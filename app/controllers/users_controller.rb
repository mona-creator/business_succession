class UsersController < ApplicationController

	def show
        @user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		redirect_to user_path, notice: "編集が完了しまいした。"
	end

    private

    def user_params
     params.require(:user).permit(:surname, :first_name, :surname_kana, :first_name_kana, :postal_code, :address, :phone_number)
    end

end
