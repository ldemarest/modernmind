class User < ActiveRecord::Base
  has_many :minds, :foreign_key => :creator_id
  has_many :neurons, :foreign_key => :contributor_id


  def self.create_from_omniauth(auth_hash)
    self.create(provider: auth_hash[:provider],
                uid: auth_hash[:uid],
                name: auth_hash[:info][:name],
                email: auth_hash[:info][:email],
                image: auth_hash[:info][:image]
                )
  end

  def self.find_by_provider_and_uid(provider, uid)
    where(provider: provider, uid: uid).first
  end
end
