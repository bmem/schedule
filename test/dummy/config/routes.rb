Rails.application.routes.draw do
  devise_for :users

  mount Schedule::Engine => "/schedule"

  root :to => 'home#index'
end
