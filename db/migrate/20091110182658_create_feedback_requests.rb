class CreateFeedbackRequests < ActiveRecord::Migration
  def self.up
    create_table :feedback_requests do |t|
      t.integer :project_id
      t.integer :user_id
      t.integer :receiver_id
      t.string :receiver_email
      t.text :text
      t.datetime :answered_at

      t.timestamps
    end
  end

  def self.down
    drop_table :feedback_requests
  end
end
