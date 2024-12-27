class AnswersController < ApplicationController
  before_action :set_question!, only: %i[create destroy]

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
    @answer = @question.answers.find_by(params[:answer_id])
    @answer.destroy
    flash[:success] = 'Answer deleted!'
    redirect_to question_path(id: @question.id)
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_question!
    @question = Question.find(params[:question_id])
  end
end
