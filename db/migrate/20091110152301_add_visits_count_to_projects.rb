class AddVisitsCountToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :visits_count, :integer
  end

  def self.down
    remove_column :projects, :visits_count
  end
end
