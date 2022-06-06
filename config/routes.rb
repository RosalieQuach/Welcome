Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts, only: [:index, :new, :create, :show, :destroy, :edit]
  resources :categories, only: [:create, :index, :destroy]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
