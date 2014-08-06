class UserMind < ActiveRecord::Base
  belongs_to :mind
  belongs_to :creator, :class_name => "User"
end
