class Upvote < ActiveRecord::Base
  belongs_to :mind
  has_many :user_upvotes
  has_many :users, :through => :user_upvotes



end