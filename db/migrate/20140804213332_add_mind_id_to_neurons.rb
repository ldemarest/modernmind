class AddMindIdToNeurons < ActiveRecord::Migration
  def change
    add_column :neurons, :mind_id, :integer
  end
end
