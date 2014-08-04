class Neuron < ActiveRecord::Base
  belongs_to :mind
  belongs_to :contributor, :class_name => "User"
end
