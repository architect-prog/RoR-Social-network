class CommentsController < ApplicationController
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])

        @comment.destroy
        
        redirect_to user_post_path(@post.user.id, @post.id)
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id

        @comment.save

        if @comment.save
          redirect_to user_post_path(@post.user_id, @post.id)
        else
          render 'new'
        end  
        
      end

    private

    def comment_params
        params.require(:comment).permit(:body)
    end
end
