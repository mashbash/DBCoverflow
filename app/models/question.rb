class Question < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :vote_count
  
  has_many :votes, :as => :votable
  has_many :responses, :as => :respondable
  has_many :answers
  belongs_to :user

  validates :title, :content, :presence => true

  def move_vote_counter(vote_type)
    vote_type == 'upvote' ? self.vote_count += 1 : self.vote_count -= 1
    self.save
  end

end
