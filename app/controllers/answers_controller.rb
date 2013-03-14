class AnswersController < ApplicationController
  def new

  end

  def index
  end

  def create
    @answer = Answer.new(user_id: current_user.id, content: params[:answer][:content], question_id: params[:answer][:question_id])
    if @answer.save
      redirect_to question_path(@answer.question)
    else
      @errors = @answer.errors.full_messages
      redirect_to question_path(@answer.question, :errors => @errors)
    end  
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
