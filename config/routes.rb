Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do
   resources :alternatives 
   resources :clinicians
   resources :measures
   resources :questions
   resources :scores
   resources :users
 end

 # authenticate user with JWT
 post 'authenticate/user', to: 'authentication#userAuthenticate'
 post 'authenticate/clinician', to: 'authentication#clinicianAuthenticate'
end
