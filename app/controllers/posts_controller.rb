class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :current_user, except: [:index, :show, :about, :all_posts]

  # GET /posts
  # GET /posts.json
  def index
    # @posts = Post.all.order("created_at DESC").page params[:page]
    @posts = Post.all.order("created_at DESC").page params[:page]
    @user = current_user
    @all = false
  end

  def all_posts
    # @posts = User.where(id: params[:id]).take.posts.all.order("created_at DESC").page params[:page]
    @posts = User.where(id: params[:id]).take.posts.all.order("created_at DESC").page params[:page]
    @all = true
    render "index"
  end

  def about
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comment = @post.comments.new
    @comments = @post.comments.all
  end

  # GET /posts/new
  def new
    @post = current_user.posts.new
  end

  # GET /posts/1/edit
  def edit
    if user_signed_in? && @post.user_id == current_user.id
    else
      redirect_to root_path
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:title, :body)
    end
end
