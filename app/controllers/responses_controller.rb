class ResponsesController < ApplicationController

  def create
    if response_params[:respondable_type] == "Question"
      question = Question.find_by(id: response_params[:respondable_id])
    else
      answer = Answer.find_by(id: response_params[:respondable_id])
      question = answer.question
    end

    new_response = Response.new(response_params)
    if new_response.save
      flash.notice = "Response saved!"
      redirect_to question_path(question)
    else
      flash.alert = "Response not saved, sorry!"
      redirect_to question_path(question)
    end
  end

  # def edit
  #   @response = response.find_by(id: params[:id])
  # end

  # def update
  #   @response = response.find_by(id: params[:id])
  #   if @response.update(response_params)

  #   else

  #   end
  # end

  def destroy
    @response = response.find_by(id: params[:id])
    @response.destroy
    flash.notice = "Response Deleted"
  end

  private

  def response_params
    params.require(:response).permit(:content, :user_id, :respondable_type, :respondable_id)
  end

end

