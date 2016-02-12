class QuestionsController < ApplicationController

  def index
    if params[:order] == "highest_voted"
      @questions = Question.by_votes
    else
      @questions = Question.by_recency
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash.notice = "Question Created"
      redirect_to question_path(@question)
    else
      render :new
    end
  end

  def edit
    @question = Question.find_by(id: params[:id])
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answer = Answer.new
  end

  def update
    @question = Question.find_by(id: params[:id])
    if @question_params.update(question_params)
      flash.notice = "Question Updated"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:content).merge(creator: current_user)
  end

end
