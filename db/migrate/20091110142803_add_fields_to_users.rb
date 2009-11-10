class AddFieldsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :description, :text
    add_column :users, :rating_points, :integer
  end

  def self.down
    remove_column :users, :rating_points
    remove_column :users, :description
  end
end
