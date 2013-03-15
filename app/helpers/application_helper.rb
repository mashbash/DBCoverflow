module ApplicationHelper

  def username(type)
    user = User.find(type.user_id)
    user.username
  end  


end
