class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :patient_number
      t.string :phone_number
      t.date :birth_date
      t.integer :education
      t.string :sex
      t.references :clinician, foreign_key: true
      t.string :password_digest

      t.timestamps
    end
  end
end
