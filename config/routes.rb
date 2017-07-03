Rails.application.routes.draw do
  namespace :v1 do
   resources :alternatives, only: [:show, :create, :destroy]
   resources :clinicians, only: [:show, :create]
   resources :journals, only: [:create]
   resources :scores, only: [:create]
   resources :users, only: [:show, :create, :update]
 end

 # authenticate user with JWT
 post 'authenticate/user', to: 'authentication#userAuthenticate'
 post 'authenticate/clinician', to: 'authentication#clinicianAuthenticate'
 get 'v1/users/scores/:id', to: 'v1/users#showscores'
 get 'v1/journals/user/:id', to: 'v1/journals#showJournals'
 post 'twilio', to: 'twilio#call'
end
