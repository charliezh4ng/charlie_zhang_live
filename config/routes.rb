Rails.application.routes.draw do
  devise_for :kings
  namespace :admin do
      resources :posts
      resources :comments

      root to: "posts#index"
    end
  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
