class UsersController < ApplicationController

  def show
    if @user = User.find_by(:id => params[:id])
      render :show
    end 
  end

end
