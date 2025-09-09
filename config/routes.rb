Rails.application.routes.draw do
  # config/routes.rb
  resources :books do
    member do
      get :confirm_delete
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
