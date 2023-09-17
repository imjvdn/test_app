class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create] # <-- Added this line

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully. You can now log in."
      redirect_to login_path
    else
      puts @user.errors.full_messages
      flash.now[:alert] = 'Account creation failed. Please check the form for errors.'
      render :new
    end
  end

  def profile
    @user = current_user
    @articles = @user.articles
  end
  

  def settings
    @user = current_user
  end
  
  def update_settings
    @user = current_user
    if @user.update(user_settings_params)
      flash[:notice] = "Settings updated successfully."
      puts "Flash message set"  # Debugging line
      redirect_to settings_path
    else
      flash.now[:alert] = 'Failed to update settings. Please check the form for errors.'
      render :settings
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def user_settings_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
