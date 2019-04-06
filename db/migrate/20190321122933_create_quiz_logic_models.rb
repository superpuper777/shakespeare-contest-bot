class CreateQuizLogicModels < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_logic_models do |t|

      t.timestamps
    end
  end
end
