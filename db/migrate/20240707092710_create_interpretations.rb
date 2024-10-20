class CreateInterpretations < ActiveRecord::Migration[6.1]
  def change
    create_table :interpretations do |t|
      t.string :question

      t.timestamps
    end
  end
end
