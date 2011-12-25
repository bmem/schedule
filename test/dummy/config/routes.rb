Rails.application.routes.draw do

  mount Schedule::Engine => "/schedule"
end
