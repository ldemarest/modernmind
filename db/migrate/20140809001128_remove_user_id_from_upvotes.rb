class RemoveUserIdFromUpvotes < ActiveRecord::Migration
  def change
    remove_column :upvotes, :user_mind, :integer
  end
end
