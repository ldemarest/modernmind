class Mind < ActiveRecord::Base
    has_many :user_minds
    # belongs_to :creator, :class_name => "User"
    # accepts_nested_attributes_for :neurons
    has_many :users, :through => :user_minds
    has_many :neurons, :through => :user_minds
end
