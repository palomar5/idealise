class CreateFeedbackRatings < ActiveRecord::Migration
  def self.up
    create_table :feedback_ratings do |t|
      t.integer :feedback_id
      t.integer :user_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :feedback_ratings
  end
end
