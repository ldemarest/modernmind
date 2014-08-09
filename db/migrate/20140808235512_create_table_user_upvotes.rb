class CreateTableUserUpvotes < ActiveRecord::Migration
  def change
    create_table :user_upvotes do |t|
      t.integer :user_id
      t.integer :upvote_id
    end
  end
end
