class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:update, :edit]

  def index
    @posts = Post.all.order(updated_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to root_path
    else
      render new_post_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      redirect_to edit_post_path(@post.id)
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params[:post].permit(:title, :body, :user_id, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    post = Post.find(params[:id])
    if current_user.id != post.user.id
      redirect_to root_path
    end
  end
end