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

  def self.sort_by_newest
    self.order("created_at DESC")
  end  

  def self.sort_by_highest_votes
    self.order("vote_count DESC")
  end  

  def self.sort_by_most_comments
    questions = self.all
    questions.sort_by{|question| question.answers.length}.reverse
  end  
    
end
