class RemoveForeignKeysFromNeurons < ActiveRecord::Migration
  def change
    remove_column :neurons, :user_id, :integer
    remove_column :neurons, :mind_id, :integer
  end
end
