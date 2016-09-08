Rails.application.routes.draw do
  get 'sessions/new'

  get 'admins/new'

  get 'users/new'

  root   'static_pages#home'
  get    '/help',     to: 'static_pages#help'
  get    '/about',    to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact'
  get    '/menu',     to: 'static_pages#menu'
  get    '/blog',     to: 'static_pages#blog'
  post   '/menu',     to: 'users#create'
  get    '/signup',   to: 'users#new'
  post   '/signup',   to: 'users#create'
  get    '/admin',    to: 'sessions#new'
  post   '/admin',    to: 'sessions#create'
  delete '/logout',   to: 'sessoins#destroy'
  resources :admins, only: [:index]
  resources :users
end
