class QuestionsController < ApplicationController
  before_action :set_question!, only: %i[show destroy edit update]

  # GET /questions/:id
  def show
    @answer = @question.answers.build
    @pagy, @answers = pagy @question.answers.order(created_at: :desc)
  end

  # DELETE /questions/:id
  def destroy
    @question.destroy
    flash[:success] = "Question deleted!"
    redirect_to questions_path
  end

  # GET /questions/:id/edit
  def edit
  end

  # PATCH /questions/:id
  def update
    if @question.update question_params
      flash[:success] = "Question updated!"
      redirect_to questions_path
    else
      render :edit
    end
  end

  # GET /questions
  def index
    @pagy, @questions = pagy Question.order(created_at: :desc)
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    @question = Question.new question_params

    if @question.save
      redirect_to questions_path
      flash[:success] = "Question created!"
    else
      render :new
    end
  end

  private

  # set questions params
  def question_params
    params.require(:question).permit(:title, :body)
  end

  # set @question instance variable
  def set_question!
    @question = Question.find params[:id]
  end
end
