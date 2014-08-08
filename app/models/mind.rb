class Mind < ActiveRecord::Base
    has_many :user_minds
    has_many :users, :through => :user_minds
    has_many :neurons, :through => :user_minds


end
