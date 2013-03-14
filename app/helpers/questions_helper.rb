module QuestionsHelper

  def question_asker(question)
    User.find(question.user_id).username
  end

end
