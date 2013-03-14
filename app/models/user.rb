class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation

  has_secure_password

  has_many :questions
  has_many :answers
  has_many :votes
  has_many :responses

  validates :email, :username, :presence => true
  validates :email, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, :length => { :minimum => 6 }

  def has_voted?(votable) #question or answer object
    Vote.where(:user_id)

  end
    


end
