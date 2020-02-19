class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end

  def create
     @user = User.find_by(email: params[:session][:email])
     if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to lists_path
     else
        flash[:error] = "Invalid Email or Password."
        redirect_to '/login'
     end
  end

  def welcome
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out successfully."
    redirect_to "/"
  end
end
