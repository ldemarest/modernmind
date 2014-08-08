class Upvote < ActiveRecord::Base
  belongs_to :mind
  has_many :users 


end