module QuestionsHelper

  def question_asker(question)
    User.find(question.user_id).username
  end

  def render_vote_errors(vote_error)
     vote_error if vote_error
  end

  def best_voted?(question)
    check_for_best = question.answers.where(best: true) #mushi array so need to put check if more than one?
    check_for_best.any? ? true : false
  end

  def best_answer(question)
    best_answer = question.answers.find_by_best(true)
    best_answer.id
  end 
    
end

