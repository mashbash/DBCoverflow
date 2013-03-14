class Question < ActiveRecord::Base
  has_many :votes, :as => :votable
  has_many :responses, :as => :respondable
  has_many :answers
  belongs_to :user

  validates :title, :content, :presence => true

  attr_accessible :title, :content, :user_id, :vote_count
end
