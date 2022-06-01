Rails.application.routes.draw do
  resources :users, path: '/users' do
    resources :posts, path: '/posts'
  end
end
