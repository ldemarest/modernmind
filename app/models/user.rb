class User < ActiveRecord::Base

  def self.create_from_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider],
                uid: auth_hash[:uid],
                name: auth_hash[:info][:name],
                email: auth_hash[:info][:email]
                )
  end

  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end
end
