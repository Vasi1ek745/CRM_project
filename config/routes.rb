Rails.application.routes.draw do

  root "main_page#index"

  get "/main_page", to: "main_page#index"

end
