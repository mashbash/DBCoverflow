class Response < ActiveRecord::Base
  attr_accessible :user_id, :content, :vote_count

  belongs_to :respondable, :polymorphic => true
  belongs_to :user
  has_many :votes, :as => :votable

  validates :content, :presence => true

  def move_vote_counter(vote_type)
    vote_type == 'upvote' ? self.vote_count += 1 : self.vote_count -= 1
    self.save
  end

end
