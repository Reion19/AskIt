class AnswersController < ApplicationController
  before_action :set_question!, only: %i[create destroy edit]
  before_action :set_answer!, only: %i[destroy edit update]

  def create
    @answer = @question.answers.build answer_params

    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question.id)
    else
      @answers = Answer.order created_at: :desc
      render 'questions/show'
    end
  end

  def destroy
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(id: @question.id)
  end

  def edit
  end

  def update
    if @answer.update answer_params
      flash[:success] = 'Answer updated!'
      redirect_to question_path(@question.id)
    else
      @answers = Answer.order created_at: :desc
      render 'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_answer!
    set_question!
    @answer = @question.answers.find_by(params[:answer_id])
  end

  def set_question!
    @question = Question.find(params[:question_id])
  end
end
