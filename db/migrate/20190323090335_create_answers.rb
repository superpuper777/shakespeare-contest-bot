class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.integer :task_id
      t.string :api_key

      t.timestamps
    end
  end
end
