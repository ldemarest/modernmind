class User < ActiveRecord::Base
  has_many :user_minds
  has_many :minds, :through => :user_minds
  has_many :neurons, :through => :user_minds

  @@complete_minds = []
  @@incomplete_minds = []


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

  def complete_minds
    self.minds.select do |mind|
      if mind.neurons.length >= 4
        mind
      end
    end

  end

  def incomplete_minds
    self.minds.select do |mind|
      if mind.neurons.length < 4
        mind
      end
    end
  end




end
