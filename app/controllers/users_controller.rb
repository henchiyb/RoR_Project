class UsersController < ApplicationController
  skip_before_action :require_signin, only: :create
  before_action :correct_user, only: [:update, :show]

  def show
    @user = User.find params[:id]
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      redirect_to root_path, :flash => { :danger => @user.errors.full_messages.join(', ') }
    end
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Profile updated!"
      redirect_to @user
    else
      flash[:danger] = @user.errors.full_messages.join(', ')
      redirect_to @user
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :phone_number, :address)
  end

  def correct_user
    @user = User.find params[:id]
    unless @user == current_user
      flash[:danger] = "Permission denied"
      redirect_to root_path
    end
  end
end
