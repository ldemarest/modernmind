class AddPublicColumntoMinds < ActiveRecord::Migration
  def change
    add_column :minds, :public, :boolean, :default => true
  end
end
