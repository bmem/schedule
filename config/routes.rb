Schedule::Engine.routes.draw do
  resources :slots

  resources :shifts

  resources :positions

  resources :people

  resources :events

end
