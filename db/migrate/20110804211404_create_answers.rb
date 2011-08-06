class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.string :content

      t.timestamps
    end
    add_index :answers, :user_id
    add_index :answers, :created_at
  end

  def self.down
    drop_table :answers
  end
end
