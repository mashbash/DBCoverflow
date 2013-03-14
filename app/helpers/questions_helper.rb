module QuestionsHelper

  def question_asker(question)
    User.find(question.user_id).username
  end

  def render_vote_errors(vote_error)
     vote_error if vote_error 
  end
end
