class CreateAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :alternatives do |t|
      t.references :user, foreign_key: true
      t.string :text

      t.timestamps
    end
  end
end
