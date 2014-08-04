class Mind < ActiveRecord::Base
    has_many :neurons
    belongs_to :creator, :class_name => "User"
  
end
