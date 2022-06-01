Rails.application.routes.draw do
  root 'users#index'
  resources :users, path: '/users' do
    resources :posts, path: '/posts'
  end
end
