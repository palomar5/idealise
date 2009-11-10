class RenameProjectKudosToProjectRatings < ActiveRecord::Migration
  def self.up
    rename_table :project_kudos, :project_ratings
  end

  def self.down
    rename_table :project_ratings, :project_kudos
  end
end
