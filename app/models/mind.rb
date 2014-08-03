class Mind < ActiveRecord::Base
    has_many :neurons
    belongs_to :user
  
end
