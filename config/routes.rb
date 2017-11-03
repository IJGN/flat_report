Rails.application.routes.draw do
  # Devise routings
  devise_for :users

  # Authenticated root path
  authenticated :user do
    root :to => "dashboard#dashboard", :as => "user_authenticated_root"
  end

  resource :me, only: [:show, :edit, :update]
  resource :team, only: [:show, :edit, :update]

  resources :members, only: [:index, :show, :new, :create], controller: :users do
    resources :posts, only: :index, module: :users
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
    resources :posts, only: [:index, :edit, :update, :destroy]
  end

  # Unauthenticated routings
  get  "/*id",to: 'pages#show', as: :page, format: false, constraints: HighVoltage::Constraints::RootRoute

  # Root path
  root 'pages#home'
end
