Schedule::Engine.routes.draw do
  resources :slots
  resources :shifts
  resources :positions
  resources :people
  resources :events
  root :to => "schedule_home#index"
end
