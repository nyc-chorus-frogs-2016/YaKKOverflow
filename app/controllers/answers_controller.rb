class AnswersController < ApplicationController

  def create
    @question = Answer.find_by(id: params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash.notice = "Answer Created"
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
  end

  def edit
    @question = @question = Answer.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @question = Answer.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    if @answer.update(answer_params)
      flash.notice = "Answer Updated"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Answer.find_by(id: params[:question_id])
    @answer = answer.find_by(id: params[:id])
    @answer.destroy
    flash.notice = "Answer Deleted"
    redirect_to  question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :question_id).merge(user: current_user)
  end

end
