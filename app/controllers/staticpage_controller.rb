class StaticpageController < ApplicationController
  def home
    if logged_in?
     
    
      render "users/home_feeds"
    end
  end
end
