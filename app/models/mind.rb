class Mind < ActiveRecord::Base
  
  validates :name, presence: true
  
  has_many :user_minds
  has_many :users, :through => :user_minds
  has_many :neurons, :through => :user_minds
  attr_reader :user_tokens

  def self.incomplete_minds
    where(:public => true).select {|mind| mind.neurons.length < 4}
  end

  def self.completed_minds
    where(:public => true).select {|mind| mind.neurons.length >= 4}
  end


  def checkmind(mind,current_user)
    !mind.users.include?(current_user)
  end


  def user_tokens=(ids)
    self.user_ids = ids.split(",")

  end
end
