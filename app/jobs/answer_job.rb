class AnswerJob < ApplicationJob
  queue_as :default
  require 'net/http'
  ANSWER_URL = 'https://shakespeare-contest.rubyroidlabs.com/quiz'.freeze
  def perform(level, question, task_id)
    Rails.logger.info "Task: #{task_id}, Question: \"#{question.gsub("\n", '\n')}\" (#{level})"
      Rails.logger.info "Params are not valid"
    else
      ActiveRecord::Base.connection_pool.with_connection do
        answer = nil
        if answer
          Rails.logger.info "Task: #{task_id}, Answer: \"#{answer}\" (#{level})"
          server_response = send_answer(answer, task_id) if Rails.env.production?
        else
          Rails.logger.info "Task: #{task_id}, Not found: \"#{question.gsub("\n", '\n')}\" (#{level})"
      end
        Log.create(
          task_id: task_id,
          level: level,
          question: question,
          answer: answer,
          server_response: server_response
        )
    end
  end
  handle_asynchronously :perform

  private

  def send_answer(answer, task_id)
    uri = URI(ANSWER_URL)
    parameters = {
      answer: answer,
      token: Rails.application.credentials.my_api_key,
      task_id: task_id
    }
    response = Net::HTTP.post_form(uri, parameters)
  end
  handle_asynchronously :send_answer
end
