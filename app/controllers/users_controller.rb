class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def confirm
    @user = User.new(user_params)
    render :new if @user.invalid?
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice:"user情報を編集しました！"
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :icon, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
