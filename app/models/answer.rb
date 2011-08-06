class Answer < ActiveRecord::Base
  attr_accessible :user_id, :content
  
  belongs_to :user
  belongs_to :question

  validates :content, :presence => true, :length => { :maximum => 300 }
  validates :user_id, :presence => true
  validates :question_id, :presence => true
  
end
