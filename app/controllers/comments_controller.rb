class CommentsController < ApplicationController
    
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to user_post_path(@post.user.id, @post.id)
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params(@post.user))
        redirect_to user_post_path(@post.user.id, @post.id)
    end

    private

    def comment_params(user)
        params.require(:comment).permit(:body)
    end
end
