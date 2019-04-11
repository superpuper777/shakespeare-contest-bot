class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :task_id
      t.integer :level
      t.string :question
      t.string :answer
      t.string :server_response

      t.timestamps
    end
  end
end
