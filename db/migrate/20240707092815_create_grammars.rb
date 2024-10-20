class CreateGrammars < ActiveRecord::Migration[6.1]
  def change
    create_table :grammars do |t|
      t.string :question

      t.timestamps
    end
  end
end
