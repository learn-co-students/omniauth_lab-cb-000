class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(uid: authenticate['uid']) do |user|
      user.name = authenticate['info']['name']
      user.email = authenticate['info']['email']
    end
    session[:user_id] = user.id
    render 'welcome/home'
  end

  private

  def authenticate
    request.env["omniauth.auth"]
  end
end
