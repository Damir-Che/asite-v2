Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :comments
    resources :likes
  end
  resources :histories
  get 'tags/:tag', to: 'posts#index', as: :tag
end
