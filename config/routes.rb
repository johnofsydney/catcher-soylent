Rails.application.routes.draw do
  resources :documents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    post '/soy-boy' => 'soy_boy#update'
  # Defines the root path route ("/")
  root "documents#index"
end
