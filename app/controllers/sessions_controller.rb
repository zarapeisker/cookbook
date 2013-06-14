class SessionsController < ApplicationController

  skip_before_filter :require_authentication

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "You logged in!"
    else
      flash.now[:alert] = "Your email or password is not correct."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "You're logged out."
  end
end
