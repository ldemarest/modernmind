class AddUserIdToUserMinds < ActiveRecord::Migration
  def change
    add_column :user_minds, :user_id, :integer
  end
end
