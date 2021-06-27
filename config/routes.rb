Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  post "/dogs" => "dogs#create"

  get "/dogs" => "dogs#index"
  get "/dogs/:id" => "dogs#show"
  patch "/dog/:id" => "dogs#update"
  delete "/dogs" => "dogs#destroy"
end
