class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.references :measure, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
