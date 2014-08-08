class UserMind < ActiveRecord::Base
  
  belongs_to :mind
  belongs_to :user
  has_many :neurons
  has_many :upvotes

  def self.find_by_user_id_and_mind_id(user_id, mind_id)
    where(:user_id => user_id, :mind_id => mind_id).first
  end

end
