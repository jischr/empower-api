class CreateClinicians < ActiveRecord::Migration[5.1]
  def change
    create_table :clinicians do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :practice
      t.string :password_digest

      t.timestamps
    end
  end
end
