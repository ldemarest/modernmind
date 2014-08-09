class RemoveUserIdsFromUpvotes < ActiveRecord::Migration
  def change
    remove_column :upvotes, :user_id, :integer
  end
end
