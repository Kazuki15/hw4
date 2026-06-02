class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  # LogIn
      redirect_to places_path
    else
      redirect_to login_path  #Failure
    end
  end

  def destroy
    session[:user_id] = nil  # LogOut
    redirect_to login_path
  end
end