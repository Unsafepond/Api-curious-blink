class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid          = auth_info.uid
      new_user.display_name = auth_info.info.name
      new_user.email        = auth_info.info.email
      new_user.bio          = auth_info.info.description
      new_user.image_url    = auth_info.info.image
      new_user.oauth_token  = auth_info.credentials.token
      new_user.partnered    = auth_info.extra.raw_info.partnered
    end
  end
end
