class CreateCommons < ActiveRecord::Migration[6.1]
  def change
    create_table :commons do |t|
      t.string :question

      t.timestamps
    end
  end
end
