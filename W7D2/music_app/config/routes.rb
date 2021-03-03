Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create]
  resources :bands
  resource :session, only: [:new, :create, :destroy]
  resources :albums, only: [:new, :show, :create, :edit, :update, :destroy]
end
