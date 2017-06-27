class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :user, foreign_key: true
      t.references :measure, foreign_key: true
      t.integer :score_value
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
