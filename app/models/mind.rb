class Mind < ActiveRecord::Base
    has_many :neurons
    has_many :user_minds
    has_many :creators, :through => :user_minds, :class_name => "User"

    accepts_nested_attributes_for :neurons
end
