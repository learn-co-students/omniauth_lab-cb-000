class User < ActiveRecord::Base
  def self.find_or_create_by_facebook(auth_hash)
    find_or_create_by(name: auth_hash[:info][:name], uid: auth_hash[:uid])
  end
end
