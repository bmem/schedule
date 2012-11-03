Rails.application.routes.draw do
  resources :people

  devise_for :users
  Devise.router_name = :main_app

  mount Schedule::Engine => "/schedule"

  root :to => 'home#index'
end
