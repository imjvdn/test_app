class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]  # <-- Existing code

  def new
    # render login form
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in successfully"
    else
      flash.now[:alert] = "Invalid username or password"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out successfully"
  end
end
