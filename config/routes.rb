Rails.application.routes.draw do
  devise_for :kings
  namespace :admin do # redirect to sign_in if not king, see: app/controllers/admin/application_controller.rb
      resources :posts
      resources :comments

      root to: "posts#index"
    end
  resources :posts do
    resources :comments
  end
  authenticated :king do
    mount Blazer::Engine, at: 'blazer'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "posts#index"
end
