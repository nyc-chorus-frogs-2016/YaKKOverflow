class QuestionsController < ApplicationController

  def index
    if params[:search]
      @questions = Question.search(params[:search])
    elsif params[:order] == "highest_voted"
      @questions = Question.by_vote_sum
    else
      @questions = Question.by_recency
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @tags = params[:tags].split(",").map {|tag| tag.strip}
    if @question.save
      @tags.each do |tag|
        @question.tags << Tag.find_or_create_by(name: tag)
      end
      flash.notice = "Question Created"
      redirect_to questions_path
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
    @vote = Vote.new
  end

  def update
    @question = Question.find_by(id: params[:id])
    if @question.update(question_params)
      flash.notice = "Question Updated"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question = Question.find_by(id: params[:id])
    @question.destroy
    flash.notice = "Question Deleted"
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :content).merge(creator: current_user)
  end

end
