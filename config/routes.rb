Schedule::Engine.routes.draw do
  resources :shifts

  resources :positions

  resources :people

  resources :events

end
