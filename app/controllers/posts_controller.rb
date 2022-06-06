class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @markers = @posts.geocoded.map do |post|
      {
          lat: post.latitude,
          lng: post.longitude
      }
    end
    if params[:query].present?
      @posts = Post.where(user_id: User.near(params[:query]).map(&:id))
    else
      @posts = Post.all
    end
  end

  def show
    @marker = [
      lat: @post.latitude,
      lng: @post.longitude
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
