Schedule::Engine.routes.draw do
  resources :slots
  resources :shifts
  resources :positions
  resources :people
  resources :events do
    resources :shifts, :slots, :positions, :people
  end
  root :to => "schedule_home#index"
end
