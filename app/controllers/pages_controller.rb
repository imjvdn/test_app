class PagesController < ApplicationController
  def home
    @welcome_message = "Welcome to the Root Page!"
  end

  def about
    @message = "Welcome to our About Page!"
  end
end
