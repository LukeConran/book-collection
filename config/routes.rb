Rails.application.routes.draw do
  resources :user_books
  resources :users
  root 'user_books#index'
  # config/routes.rb

  
  resources :books do
    member do
      get :confirm_delete
    end
  end
end
