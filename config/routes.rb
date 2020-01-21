Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get    'events', to: 'events#index'

  get    'events/new', to: 'events#new'
  post   'events', to: 'events#create'

  # get    'events/:id', to: 'events#show', as: :event

  get    'events/:id/edit', to: 'events#edit', as: 'edit_event'
  patch  'events/:id', to: 'events#update'

  delete 'events/:id', to: 'events#destroy'

  get 'events/missing_out'
  get 'events/club_futuro_vol_1_the_exhibition'
  get '/privacy_cookie_policy' => 'pages#privacy_cookie_policy'

end
