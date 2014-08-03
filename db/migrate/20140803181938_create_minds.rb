class CreateMinds < ActiveRecord::Migration
  def change
    create_table :minds do |t|
      t.string :name

      t.timestamps
    end
  end
end
