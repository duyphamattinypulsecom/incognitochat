class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to messages_path
        else
            render 'welcome/index'
        end
    end

    private 
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :email)
    end
end
