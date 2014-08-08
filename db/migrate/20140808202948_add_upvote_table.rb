class AddUpvoteTable < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :mind_id
      t.integer :count, :default => 0
    end
  end
end
