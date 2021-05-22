Rails.application.routes.draw do
  get 'pages', to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'about', to: 'pages#about'
  get 'Home', to: 'about#home'
  resources :articles
end
