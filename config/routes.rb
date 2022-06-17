Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {registrations: :registrations, sessions: :sessions}
  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {registrations: :registrations, sessions: :sessions}      
      resources :users, path: '/users' do
        resources :posts, path: '/posts' do
          resources :comments, only: [:new, :create, :destroy, :index]
          resources :likes, only: [:new, :create]
        end
      end
    end
  end
  root 'users#index'
  resources :users, path: '/users' do
    resources :posts, path: '/posts' do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end
end
