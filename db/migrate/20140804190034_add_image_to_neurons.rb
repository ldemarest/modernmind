class AddImageToNeurons < ActiveRecord::Migration
  def change
    add_column :neurons, :image, :text
  end
end
