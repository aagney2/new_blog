Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "blogs#index"
  resources :blogs do
    get :user_stats, on: :collection
  end
  namespace :api do
    namespace :v1 do
      resources :blogs
    end
  end
end
