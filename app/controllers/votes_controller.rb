class VotesController < ApplicationController


  def create
    @context = context
    @vote = @context.votes.new(vote_params)
    @vote.save

    if params[:answer_id]
      redirect_to question_path(Question.find_by(id: Answer.find_by(id: @vote.votable_id).question.id))
    else
      redirect_to question_path(Question.find_by(id: @vote.votable_id))
    end
  end

  private

  def context
    if params[:answer_id]
      Answer.find(id = params[:answer_id])

    else
      Question.find(id = params[:question_id])
    end
  end

  def vote_params
    params.require(:vote).permit!.merge(user: current_user)
  end

end
