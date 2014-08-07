class RemoveCreatorIdFromUserMinds < ActiveRecord::Migration
  def change
    remove_column :user_minds, :creator_id, :integer
  end
end
