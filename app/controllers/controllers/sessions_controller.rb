class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    if omniauth_hash = request.env["omniauth.auth"]
      user = User.find_or_create_from_omniauth(omniauth_hash)
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      if user = User.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to '/sessions/new'
      end

    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
