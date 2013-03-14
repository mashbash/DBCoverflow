class QuestionsController < ApplicationController
  before_filter :find_question, :except => [:index]
  before_filter :find_asker, :except => [:index]
  before_filter :build_answer, :only => [:show, :vote]

  def index
    @questions = Question.all
  end

  def create
    puts params
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
      @errors = @question_response.errors.full_messages  
      redirect_to question_path(@question, :response_errors => @errors)
    end
  end

  def vote
    puts params.inspect
    puts @question.inspect
    if params[:vote] == 'upvote'
      vote_count = @question.vote_count + 1
      @updated_question = @question.update_attributes(:vote_count => vote_count)
      puts @updated_question.inspect
      redirect_to question_path(@updated_question)
    end
    # vote = @question.votes.new(user_id: current_user.id) 
    #   if params[:type] == 'upvote'
    #     @question.vote_count += 1
    #   else 
    #     @question.vote_count -= 1
    #   end
    #   @question.save
    # if vote.save 
    #   redirect_to questions_path(@question)
    # else
    #   @vote_error = "you can't vote again!"
    #   render :show
    # end  
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
