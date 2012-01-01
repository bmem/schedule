Rails.application.routes.draw do
  mount Schedule::Engine => "/schedule"

  root :to => 'home#index'
end
