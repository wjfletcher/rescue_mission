class AnswersController < ApplicationController

  def create
    @answer = Answer.new(answer_params)

    @question = Question.find(params[:question_id])
    @answer.question = @question

    if @answer.save
      redirect_to @answer.question, notice: "Anser successfully submitted!"
    else
      require "pry-rails"
      @question = Question.find(params[:question_id])
      @answers = @question.answers.order(:created_at)

      @errors = @answer.errors.full_messages
      render "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :question_id, :user_id)
  end
end
