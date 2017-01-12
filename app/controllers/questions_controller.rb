class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new(question_id: @question)
    @answers = @question.answers.order(score: :desc)
  end

  def new
    if user_signed_in?
      @question = Question.new
    else
      redirect_to questions_path, notice: "Please Sign In To Submit Your Queshun"
    end
  end

  def create
    @question = Question.new(question_params)

    @question.user_id = current_user.id

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
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      @errors = @question.errors.full_messages
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.destroy_all
    @question.destroy

    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
