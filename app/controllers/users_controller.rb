class UsersController < ApplicationController
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
      
      if current_user.id == @user.id
        redirect_to root_path, notice: 'User deleted.'
      else
        redirect_to users_path, notice: 'User deleted.'
      end
    end
end
