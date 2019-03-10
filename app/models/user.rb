class User < ActiveRecord::Base


  def self.find_or_create_from_auth_hash(auth)
    # binding.pry
    user = find_or_create_by(uid: auth['uid'], name: auth['info']['name'])
    if User.exists?(user.id)
      user
    else
      user.save!
      user
    end
  end


end
