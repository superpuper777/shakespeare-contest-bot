class QuizController < ApplicationController
  def index
    logger.info
  end

  def create
    @question = Question.new(quest_params)
    QuizLogicModel.determine_lvl(quest_params[:level])
    AnswerJob.perform(level, question, task_id)
    head :ok
  end

  def quest_params
    params.require(:question),permit(:answer, :task_id, :level)
  end
end
