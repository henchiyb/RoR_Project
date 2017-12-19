class SessionsController < ApplicationController
  skip_before_action :require_signin, only: :create

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      get_cart user
      if user.address && user.phone_number && user.name
        flash[:success] = "Welcome!"
        redirect_to root_path
      else
        flash[:success] = "Please update your profile!"
        redirect_to user
      end
    else
      flash[:danger] = "The account name or password that you have entered is incorrect."
      redirect_to root_path
    end
  end

  def destroy
    session.delete :order_id
    log_out
    redirect_to root_path
  end
end


