class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new(question_id: @question)
    @answers = @question.answers.order(:created_at)
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: "Qusssesin successfully submitted!"
    else
      require "pry-rails"

      @errors = @question.errors.full_messages
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    if Question.update(question_params)
      @question = Question.find(params[:id])
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
