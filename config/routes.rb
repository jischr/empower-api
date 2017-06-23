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
 post 'authenticate', to: 'authentication#authenticate'
end
