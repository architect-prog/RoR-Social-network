class UsersController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
      :following, :followers]
      
    def show
        user = User.find(params[:id])
        
        if user.id == current_user.id
          redirect_to root_path
        else
          @user = user
          @posts = user.posts
        end    
    end
    
    def all
        @users = User.all
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      
      if current_user == nil || current_user.id == @user.id 
        redirect_to root_path, notice: 'User deleted.'
      else
        redirect_to users_path, notice: 'User deleted.'
      end
    end    
end
