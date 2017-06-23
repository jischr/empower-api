# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Clinician.create(
  first_name: 'Larry',
  last_name: 'Smith',
  email: 'larrysmith@gmail.com',
  practice: 'L Smith LLC',
  password: 'password',
  password_confirmation: 'password')

User.create(
  first_name: 'Jennifer',
  last_name: 'Winer',
  email: 'jenniferwiner@gmail.com',
  patient_number: '1234',
  phone_number: '3035889350',
  password: 'password',
  password_confirmation: 'password')
