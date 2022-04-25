Rails.application.routes.draw do
  resources :blogs
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit]
  resources :bookmarks, only: [:create, :destroy, :show]
end
