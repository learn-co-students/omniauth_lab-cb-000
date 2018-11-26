class User < ActiveRecord::Base

  def self.find_or_create_by_auth(auth_hash)

    self.where(uid: auth_hash[:uid]).first_or_create do |user|
      user.provider = auth_hash[:provider]
      user.email = auth_hash[:info][:email]
      user.name = auth_hash[:info][:name]
    end
  end

end
