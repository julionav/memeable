Rails.application.routes.draw do
  devise_for :users

  root 'memes#index'
  get "/popular", to: "memes#popular"
  resources :memes, only: [:show, :new, :create] do
    resources :comments, only: :create
  end
  resources :categories, only: [:index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
