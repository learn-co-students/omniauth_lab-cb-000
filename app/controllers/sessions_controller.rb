class SessionsController < ApplicationController
  def create
    #binding.pry
    req = auth_hash
    @user = User.find_or_create_by(uid: req[:uid])
    @user.name = req[:info][:name]
    @user.save
    session[:user_id] = @user.id
    render 'welcome/home'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
