class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.string :name
      t.string :act_name
      t.text :content

      t.timestamps
    end
  end
end
