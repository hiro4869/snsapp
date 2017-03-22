class PostsController < ApplicationController
  before_action:set_post, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
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
    @post.update(post_params)
    redirect_to root_path
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end



  private

  def post_params
    params[:post].permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
