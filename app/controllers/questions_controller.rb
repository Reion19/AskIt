class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  def index
    @pagy, @questions = pagy Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Question created!"
      redirect_to questions_path
    else
      render :new
    end
  end

  def show
    @answer = @question.answers.build
    @pagy, @answers = pagy @question.answers.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @question.update question_params
      flash[:success] = "Question updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    flash[:success] = "Question deleted"
    redirect_to questions_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question!
    @question = Question.find params[:id]
  end
end
