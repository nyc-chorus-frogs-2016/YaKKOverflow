class VotesController < ApplicationController

  def create
    @context = context
    @vote = @context.votes.new(vote_params)
    @vote.save
    redirect_to questions_path
  end

  private

  def context
    if params[:question_id]
      Question.find(id = params[:question_id])
    else
      Answer.find(id = params[:question_id])
    end
  end

  def vote_params
    params.require(:vote).permit!.merge(user: current_user)
  end

end
