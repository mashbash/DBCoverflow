class ResponsesController < ApplicationController

  before_filter :find_response, :only => [:vote]

  def vote
    vote = @response.votes.new(user_id: current_user.id)
    if vote.save
      @response.move_vote_counter(params[:vote_type])
      redirect_to question_path(@response.respondable_id)
    else
      redirect_to question_path(@response.respondable_id), :notice => "you can't vote again!"
    end 
  end

private

  def find_response
    @response = Response.find(params[:id])
  end


end
