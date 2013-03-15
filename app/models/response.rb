class Response < ActiveRecord::Base
  
  attr_accessible :user_id, :content, :vote_count

  belongs_to :respondable, :polymorphic => true
  belongs_to :user

  validates :content, :presence => true
  
end
