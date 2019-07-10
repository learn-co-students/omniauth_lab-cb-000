class WelcomeController < ApplicationController
  def home
    session[:user_id]
  end  
end
