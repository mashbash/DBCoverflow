class Answer < ActiveRecord::Base
  
  attr_accessible :content, :question_id, :user_id, :vote_count

  belongs_to :user
  belongs_to :question
  has_many :votes, :as => :votable
  has_many :responses, :as => :respondable
  
  validates :content, :presence => true

  def move_vote_counter(vote_type) #mushi how to refactor and only this in one place
    vote_type == 'upvote' ? self.vote_count += 1 : self.vote_count -= 1
    self.save
  end
  
end
