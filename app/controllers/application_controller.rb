class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_signin

  def require_signin
    unless log_in?
      flash[:danger] = "You need to sign in!"
      redirect_to root_path
    end
  end

end
