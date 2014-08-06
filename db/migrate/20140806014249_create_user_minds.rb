class CreateUserMinds < ActiveRecord::Migration
  def change
    create_table :user_minds do |t|
      t.integer :mind_id
      t.integer :creator_id
      t.timestamps
    end
  end
end
