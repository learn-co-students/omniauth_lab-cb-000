class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]
    user = User.where(:name =>auth_hash["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
    session[:user_id] = user.id
    redirect_to root_path
  end
end
