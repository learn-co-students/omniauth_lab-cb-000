class User < ActiveRecord::Base

  #has_secure_password

  def self.find_or_create_from_omniauth(auth_hash)
    where(:uid => auth_hash[:uid]).first_or_create do |u|
      #u.password = SecureRandom.hex
      u.provider = auth_hash[:provider]
      u.uid = auth_hash[:uid].to_i
      u.email = auth_hash[:info][:email]
      u.name = auth_hash[:info][:name]
      u.image = auth_hash[:info][:image]
    end

  end

end
