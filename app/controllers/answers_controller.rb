class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)
  end

  def show
    @answer = Answer.find_by(id: params[:id]), locals: {answer: @answer}
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
