class Neuron < ActiveRecord::Base
  # belongs_to :mind
  # belongs_to :contributor, :class_name => "User"
  # belongs_to :user
  belongs_to :user_mind

end
