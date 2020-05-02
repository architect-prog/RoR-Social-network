class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index     
    user = User.find(params[:user_id])
    @posts = user.posts
    @user = user
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @user = User.find(params[:user_id])
  end

  # GET /posts/new
  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  # GET /posts/1/edit
  def edit
    user = User.find(params[:user_id])
    @user = user
    @post = user.posts.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = Post.new(post_params)

    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@user.id, @post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    user = User.find(params[:user_id])
    @user = user
    @post = user.posts.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to user_post_path(@user.id, @post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @user = User.find(params[:user_id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_path(@user.id), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, images: [])
    end
end
