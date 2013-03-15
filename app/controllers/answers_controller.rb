class AnswersController < ApplicationController
  before_filter :find_answer, :find_question, :find_asker, :only => [:vote]

  def new
    #bugbug didn't have to instantiate a new answer object because it was done using build in quetions controller?
  end

  def index
  end

  def create
    @answer = Answer.new(user_id: current_user.id, content: params[:answer][:content], question_id: params[:answer][:question_id])
    respond_to do |format|
      if @answer.save
        format.js
      else
        format.js
        format.html { redirect_to question_path(@answer.question) }
      end
    end  
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.best = true
    @answer.save
    redirect_to question_path(@answer.question)
  end

  def responses
    @answer = Answer.find(params[:id]) #mushi this is not needed? check before filter
    @answer_responses = @answer.responses.new(user_id: current_user.id, content: params[:answer][:content])
    if @answer_responses.save
      redirect_to question_path(@answer.question.id)
    else
      flash[:error] = "Can't be blank!"
      redirect_to question_path(@answer.question.id) 
    end  
  end  

  def vote
    vote = @answer.votes.new(user_id: current_user.id)
    if vote.save
      @answer.move_vote_counter(params[:vote_type])
      redirect_to question_path(@question)
    else
      redirect_to @question, :notice => "you can't vote again!"
    end 
  end

  private 

  def find_answer
    @answer = Answer.find(params[:id])
  end  

  def find_question
    @question = @answer.question
  end

  def find_asker
    @question_asker = User.find(find_question.user_id)
  end  

end
