class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @posts = Post.joins(:user).where(user: { location: params[:query] })
    else
      @posts = Post.all.reorder(created_at: :desc)
    end
    @posts = @posts.filter_by_category(params[:category_id]) if params[:category_id].present?
  end

  def show
    @marker = [
      lat: @post.user.latitude,
      lng: @post.user.longitude
    ]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :is_offer, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
