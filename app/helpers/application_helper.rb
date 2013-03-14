module ApplicationHelper

  def username(arg)
    user = User.find(arg.user_id)
    user.username
  end  


end
