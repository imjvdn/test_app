class PagesController < ApplicationController
  skip_before_action :require_user  # <-- Added this line to skip the authentication for all actions in this controller

  def home
    @welcome_message = "Welcome to the Root Page!"
  end

  def about
    @message = "Welcome to our About Page!"
  end
end
