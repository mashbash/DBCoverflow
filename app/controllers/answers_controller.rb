class AnswersController < ApplicationController

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
        format.html { redirect_to question_path(@answer.question, :errors => @errors) }
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
    p "yo I'm in update!"
    p ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  end

  def responses
    @answer = Answer.find(params[:id])
    @answer_responses = @answer.responses.new(user_id: current_user.id, content: params[:content])
    if @answer_responses.save
      redirect_to question_path(@answer.question.id)
    else
      flash[:error] = "Can't be blank!"
      redirect_to question_path(@answer.question.id) 
    end  
  end  
end
