class PagesController < ApplicationController
    def home
    end

    def about
        @message = "Welcome to our About Page!"
      end
end
