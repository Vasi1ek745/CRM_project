Rails.application.routes.draw do
  devise_for :users
  
  get 'jobs/calendar', to: "jobs#calendar"

  root "main_page#index"

  resources :clients do 
     resources :jobs
    
  end

  post "/jobs", to: "jobs#index"

  get "/main_page", to: "main_page#index"
  get "/main_page/about", to: "main_page#about"
  get "/jobs", to: "jobs#index"


end
