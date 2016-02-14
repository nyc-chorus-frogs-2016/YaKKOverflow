class AnswersController < ApplicationController

  def create
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.new(answer_params)
    if @answer.save
      flash.notice = "Answer Created"
      redirect_to question_path(@question)
    else
      redirect_to question_path(@question)
    end
  end

  def edit
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    if @answer.update(answer_params)
      flash.notice = "Answer Updated"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def mark_best_answer
    answer = Answer.find_by(id: params[:id])
    if current_user == answer.question.creator
      if answer_params[:is_best_answer] == "1"
        answer.mark_as_best_answer(true)
      elsif answer_params[:is_best_answer] == "0"
        answer.mark_as_best_answer(false)
      end
      if answer.save && answer.question.save
        binding.pry
        flash.notice = "You've selected or deselected a best answer."
        redirect_to question_path(answer.question)
      else
        flash.alert = "Oops, something has gone wrong."
        redirect_to question_path(answer.question)
      end
    end
  end

  def destroy
    @question = Question.find_by(id: params[:question_id])
    @answer = Answer.find_by(id: params[:id])
    @answer.destroy
    flash.notice = "Answer Deleted"
    redirect_to  question_path(@question)
  end

  private

  def best_answer_params
    params.require(:answer).permit(:is_best_answer)
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id, :is_best_answer).merge(user: current_user)
  end

end
