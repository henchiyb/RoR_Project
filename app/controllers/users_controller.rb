class UsersController < ApplicationController
  skip_before_action :require_signin, only: :create

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

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :phone_number, :address)
  end
end
