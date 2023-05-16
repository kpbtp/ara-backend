Rails.application.routes.draw do
  resources :anime_lists
  devise_for :users
  resources :animes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
