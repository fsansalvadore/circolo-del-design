Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # get 'events/index'
  # get 'events/show'
  # get 'events/new'
  # get 'events/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get    'whats-on/calendario', to: 'events#index'

  get    'events/new', to: 'events#new'
  post   'events', to: 'events#create'

  get    'whats-on/:id', to: 'events#show', as: :event

  get    'events/:id/edit', to: 'events#edit', as: 'edit_event'
  patch  'events/:id', to: 'events#update'

  delete 'events/:id', to: 'events#destroy'

  get '/privacy_cookie_policy' => 'pages#privacy_cookie_policy'
  get '/contatti' => 'pages#contacts'

  # about
  get '/about-us/il-circolo' => 'pages#about_circolo'
  get '/about-us/team' => 'pages#about_team'
  get '/about-us/sostenitori' => 'pages#about_sostenitori'
  get '/about-us/store' => 'pages#about_store'
end
