class AddContributorIdToNeurons < ActiveRecord::Migration
  def change
    add_column :neurons, :contributor_id, :integer
  end
end
