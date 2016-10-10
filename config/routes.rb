Rails.application.routes.draw do
  get 'orders/new'

  get 'sessions/new'

  get 'admins/new'

  get 'users/new'

  root   'static_pages#home'
  get    '/help',      to: 'static_pages#help'
  get    '/about',     to: 'static_pages#about'
  get    '/contact',   to: 'static_pages#contact'
  get    '/menu',      to: 'static_pages#menu'
  get    '/blog',      to: 'posts#index'
  post   '/menu',      to: 'users#create'
  get    '/signup',    to: 'users#new'
  post   '/signup',    to: 'users#create'
  get    '/admin',     to: 'sessions#new'
  post   '/admin',     to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  get    '/write',     to: 'posts#new'
  post   '/write',     to: 'posts#create'
  post   '/blog',      to: 'users#create'
  get    '/order',     to: 'orders#new'
  get    '/order-confirmation', to: 'orders#confirmation'
  resources :admins, only: [:index]
  resources :users
  resources :posts
  resources :orders
end
