class AddMindMakerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mind_maker, :boolean, :default => false
  end
end
