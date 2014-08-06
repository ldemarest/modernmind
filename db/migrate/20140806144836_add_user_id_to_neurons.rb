class AddUserIdToNeurons < ActiveRecord::Migration
  def change
    add_column :neurons, :user_id, :integer
  end
end
