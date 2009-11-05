class CreateProjectKudos < ActiveRecord::Migration
  def self.up
    create_table :project_kudos do |t|
      t.integer :project_id
      t.integer :rating
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_kudos
  end
end
