class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :question

      t.timestamps
    end
  end
end
