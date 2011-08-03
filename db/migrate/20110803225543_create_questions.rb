class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :user_id
      t.string :content

      t.timestamps
    end
    add_index :questions, :user_id
    add_index :questions, :created_at
  end

  def self.down
    drop_table :questions
  end
end
