class QuestionsController < ApplicationController
  before_filter :find_question, :except => [:index, :new, :create]
  before_filter :find_asker, :except => [:index, :new, :create]
  # before_filter :build_answer, :only => [:show]

  def index
    @questions = Question.all
    @newest_questions = Question.sort_by_newest
    @popular_questions = Question.sort_by_highest_votes
    @most_commented_questions = Question.sort_by_most_comments
    
    respond_to do |format|
      format.js
      format.html 
      format.json
    end
  end

  def create
    @question = Question.new(title: params[:question][:title], 
                             content: params[:question][:content], 
                             user_id: current_user.id)
    if @question.save 
      redirect_to user_path(current_user.id)
    else
      @errors = @question.errors.full_messages
      render :new
    end
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @errors = params[:errors] 
    @response_errors = params[:response_errors]
  end

  def responses
    @question_response = @question.responses.new(user_id: current_user.id, content: params[:content]) #bugbug
    if @question_response.save
      redirect_to question_path(@question)
    else 
      @response_errors = @question_response.errors.full_messages  
      redirect_to question_path(@question, :response_errors => @response_errors)
    end
  end

  def vote
    vote = @question.votes.new(user_id: current_user.id) 
    if vote.save
      @question.move_vote_counter(params[:vote_type])
      redirect_to question_path(@question)
    else
      @vote_error = "you can't vote again!"
      render :show
    end  
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_asker
    @question_asker = User.find(find_question.user_id)
  end

  def build_answer
    @answer = @question.answers.build
  end

end
