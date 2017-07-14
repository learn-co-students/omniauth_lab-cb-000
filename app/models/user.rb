class User < ActiveRecord::Base
  def self.find_or_create_by_omniauth(auth_params)
    where(uid: auth_params[:uid], name: auth_params[:info][:name]).
      first_or_create do |u|
        u.email = auth_params[:info][:email]
        u.provider = auth_params[:provider]
      end
  end
end
