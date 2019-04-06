class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :quiestion
      t.integer :task_id
      t.integer :level

      t.timestamps
    end
  end
end
