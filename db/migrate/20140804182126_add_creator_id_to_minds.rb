class AddCreatorIdToMinds < ActiveRecord::Migration
  def change
    add_column :minds, :creator_id, :integer
  end
end
