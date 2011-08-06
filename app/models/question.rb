class Question < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :user
  has_many :answers, :dependent => :destroy

  validates :content, :presence => true, :length => { :maximum => 300 }
  validates :user_id, :presence => true
  
  default_scope :order => 'questions.created_at DESC'  
end
