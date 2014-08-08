class Mind < ActiveRecord::Base
  has_many :user_minds
  has_many :users, :through => :user_minds
  has_many :neurons, :through => :user_minds

  def self.incomplete_minds
    where(:public => true).select {|mind| mind.neurons.length < 4}
  end

  def self.completed_minds
    where(:public => true).select {|mind| mind.neurons.length >= 4}
  end


  def checkmind(mind,current_user)
    !mind.users.include?(current_user)
  end
end
