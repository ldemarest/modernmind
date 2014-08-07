class AddUserMindIdToNeurons < ActiveRecord::Migration
  def change
    add_column :neurons, :user_mind_id, :integer
  end
end
