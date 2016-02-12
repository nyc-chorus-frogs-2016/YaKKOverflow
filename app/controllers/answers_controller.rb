class AnswersController < ApplicationController

  def create
    @answer = Answer.create(answer_params)
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end

end
