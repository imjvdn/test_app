class UsersController < ApplicationController
  def new
    # Remove :user_id from the session
    session.delete(:user_id)
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Remove :user_id from the session
      session.delete(:user_id)
      flash[:notice] = "Account created successfully. You can now log in."
      redirect_to login_path
    else
      puts @user.errors.full_messages  # Debugging line
      flash.now[:alert] = 'Account creation failed. Please check the form for errors.'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
