class UserUpvote < ActiveRecord::Base
  belongs_to :user
  belongs_to :upvote
  
end