class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :index]
  before_action :correct_user, only: [:edit, :update]
  def new
    @user = User.new
  end

  def show
    @categories = Category.all
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the ShameBird!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "用户档案已更新"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @categories = Category.all
    @users = User.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # 事前过滤器

    # 确保用户已登录

    def logged_in_user
      unless logged_in?
        store_location
        flash[:warning] = "请先登录"
        redirect_to login_url
      end
    end


    # 确保是正确的用户
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
