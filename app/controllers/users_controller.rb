class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :home
]
    def home
    end
    
    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = User.last.id
            redirect_to user_path(user)
        else
           redirect_to new_user_path
        end
    end

    def show
        @user = User.find_by_id(session[:user_id])
    end
    
      private
    
    def user_params
        params.require(:user).permit(:name, :password, :tickets, :height, :happiness, :nausea, :admin)
    end

    
end