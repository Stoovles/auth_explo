class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      redirect_to new_user_path
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
