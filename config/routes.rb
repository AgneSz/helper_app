Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/users", to: "users#index"

  root to: redirect("/users")
  resources :users do
    collection do
      post :import
    end
  end
end
