require 'spec_helper'

describe User do
  it { should have_many(:questions) }
  it { should have_many(:answers) }
  it { should have_many(:votes) }
  it { should have_many(:responses) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_confirmation_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }

  context '#valid?' do
    it 'should have valid email' do
      emails = ['hello@gmail.com', 'HEY@g.net', 'D234@yahoo.eu', 'fe@fek.com']
      emails.each do |email|
        @user = User.new(username: email, email: email, password: 'heyhey')
        @user.should be_valid
      end
    end

    it 'should not have an invalid email' do
      emails = ['@12.12', 'jlk.com', '!@.com', 'j@jc']
      emails.each do |email|
        @user = User.new(username: email, email: email, password: 'heyhey')
        @user.should_not be_valid
      end
    end  
  end
end
