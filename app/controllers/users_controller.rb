class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to users_path
        else
            render 'welcome/index'
        end
    end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password, :email)
    end
end
