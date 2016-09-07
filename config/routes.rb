Rails.application.routes.draw do
  get 'admins/new'

  get 'users/new'

  root   'static_pages#home'
  get    '/help',     to: 'static_pages#help'
  get    '/about',    to: 'static_pages#about'
  get    '/contact',  to: 'static_pages#contact'
  get    '/menu',     to: 'static_pages#menu'
  get    '/blog',     to: 'static_pages#blog'
  post   '/menu',     to: 'users#create'
end
