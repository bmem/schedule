Rails.application.routes.draw do
  resources :people

  devise_for :users

  mount Schedule::Engine => "/schedule"

  root :to => 'home#index'
end
