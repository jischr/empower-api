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
  email: 'jennifer@me.com',
  patient_number: '1234',
  phone_number: '3035889350',
  password: 'password',
  password_confirmation: 'password',
  sex: 'Female',
  birth_date: '1994-01-05',
  education: 'Associate\'s or Bachelor\'s Degree',
  clinician_id: 1
)

User.create(
  first_name: 'Emily',
  last_name: 'Ringoen',
  email: 'emily@me.com',
  patient_number: '1111',
  phone_number: '3035889350',
  password: 'cookies',
  password_confirmation: 'cookies',
  sex: 'Female',
  birth_date: '1993-9-21',
  education: 'Associate\'s or Bachelor\'s Degree'
)

Measure.create(
  name: 'GAD-7'
)

Alternative.create(
  user_id: 1,
  text: 'Take a walk'
)

Alternative.create(
  user_id: 1,
  text: 'Drink a cup of tea'
)

Alternative.create(
  user_id: 2,
  text: 'Run a marathon'
)

Score.create(
  user_id: 1,
  measure_id: 1,
  score_value: 15
)

Score.create(
  user_id: 1,
  measure_id: 1,
  score_value: 10
)

Score.create(
  user_id: 1,
  measure_id: 1,
  score_value: 19
)

Score.create(
  user_id: 1,
  measure_id: 1,
  score_value: 12
)

Journal.create(
  user_id: 1,
  title: "Feeling Anxious",
  content: "Today I have been anxious. I can't calm down! Nothing will help. I don't even know what it is that is actually making me anxious....I don't know what to do.",
  sentiment: "fa fa-frown-o sentiment-icon"
)

Journal.create(
  user_id: 1,
  title: "Better Day",
  content: "Man, today was much better. It is amazing what spending time with friends can do for my well being. I feel at peace for the first time in a long time--like I can breathe again.",
  sentiment: "fa fa-smile-o sentiment-icon"
)
