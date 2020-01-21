Rails.application.routes.draw do
  devise_for :users
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/missing_out'
  get 'events/club_futuro_vol_1_the_exhibition'
  get '/privacy_cookie_policy' => 'pages#privacy_cookie_policy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

end
