Schedule::Engine.routes.draw do
  resources :work_logs, :path => 'worklogs'
  resources :slots do
    resources :work_logs, :path => 'worklogs'
  end
  resources :shifts do
    resources :slots
    resources :work_logs, :path => 'worklogs'
    post 'copy', :on => :member
  end
  resources :positions
  resources :people
  resources :events do
    resources :shifts, :slots, :positions, :people
    resources :work_logs, :path => 'worklogs'
  end
  root :to => "schedule_home#index"
end
