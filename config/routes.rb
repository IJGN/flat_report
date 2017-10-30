Rails.application.routes.draw do
  # Devise routings
  devise_for :users

  # Authenticated routings
  authenticated :user do
    root :to => "dashboard#dashboard", :as => "user_authenticated_root"
  end
  resource :me, only: :update
  resource :team, only: [:show, :update]

  resources :users, only: [:index, :show, :create] do
    resources :posts, only: :index, controller: 'users/posts'
  end

  resources :posts, only: [:show, :new, :create] do
    resources :stars, only: :create, controller: 'posts/stars' do
      delete :destroy, on: :collection
    end
  end

  namespace :me do
    namespace :posts do
      resources :stars, only: :index
    end
    resources :posts, only: [:index, :show, :update, :destroy]
  end

  # Unauthenticated routings
  get  "/*id",                 to: 'pages#show',      as: :page, format: false, constraints: HighVoltage::Constraints::RootRoute

  # Root path
  root 'pages#home'
end
