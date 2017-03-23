class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :correct_user, only: [:update, :edit]
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to edit_user_path(@user.id)
    end
  end

  private

  def user_params
    params[:user].permit(:nickname, :profile, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to users_path
    end
  end

end

