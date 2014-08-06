class RemoveContributorIdFromNeurons < ActiveRecord::Migration
  def change
    remove_column :neurons, :contributor_id, :integer
  end
end
