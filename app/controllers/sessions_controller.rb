class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_omniauth(auth_params)
    
    session[:user_id] = @user.id
    
    redirect_to root_path
  end
  
  private
  
  def auth_params
    request.env['omniauth.auth']
  end
end