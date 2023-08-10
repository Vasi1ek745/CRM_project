Rails.application.routes.draw do

  root "main_page#index"

  resources :clients do 
     resources :jobs
    
  end

  get "/main_page", to: "main_page#index"
  get "/main_page/about", to: "main_page#about"


end
