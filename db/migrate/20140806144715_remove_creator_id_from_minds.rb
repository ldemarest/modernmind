class RemoveCreatorIdFromMinds < ActiveRecord::Migration
  def change
    remove_column :minds, :creator_id, :integer
  end
end
