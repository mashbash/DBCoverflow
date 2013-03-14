class Response < ActiveRecord::Base
  belongs_to :respondable, :polymorphic => true
  belongs_to :user

  attr_accessible :user_id, :content

  validates :content, :presence => true
end
