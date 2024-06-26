Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index'

  get    'home-page-staging',      to: 'pages#home_page_staging'

  # resources :contacts, only: [:index, :new, :create]
  get    'contatti',      to: 'contacts#index'
  post   'contatti',      to: 'contacts#create'
  get    'contatti/new',  to: 'contacts#new'

  get    'whats-on/programma',          to: 'events#index'
  #get    'whats-on/eventi-passati',    to: 'events#eventi_passati'

  get    'events/programma/new',        to: 'events#new'
  post   'events/programma',            to: 'events#create'

  get    'whats-on/programma/:slug',    to: 'events#show',  as: :event

  get    'events/programma/:slug/edit', to: 'events#edit',  as: 'edit_event'
  patch  'events/programma/:slug',      to: 'events#update'

  delete 'events/programma/:slug',      to: 'events#destroy'

  get    'whats-on/i-volti-2019',       to: 'faces#index'
  get    'whats-on/i-volti-2019/:slug', to: 'faces#show',   as: :face

  # standalone
  get '/privacy_cookie_policy' => 'pages#privacy_cookie_policy'
  get '/operazione-trasparenza' => 'pages#operazione_trasparenza'
  get '/contatti' => 'pages#contacts'

  # blog
  get    'whats-on/HomingCdD',        to: redirect('whats-on/WPAC', status: 302)
  get    'whats-on/HomingCdD/:slug',  to: 'blog_posts#show', as: :blog_post

  # WPAC
  get    'whats-on/WPAC',                   to: 'articles#index', as: :wpac
  get    'whats-on/WPAC/:slug',             to: 'articles#show',  as: :wpac_article
  get    'whats-on/WPAC/media/:media_type', to: 'articles#media', as: :articles_media
  get    'whats-on/WPAC/tema/:tag',         to: 'articles#tag',   as: :articles_tag

  # about
  get '/about-us/il-circolo'          => 'pages#about_circolo'
  get '/about-us/team'                => 'pages#about_team'
  get '/about-us/young-board-2021'    => 'pages#about_young_board_2021'
  get '/about-us/5x1000'              => 'pages#about_5x1000'
  get '/about-us/sostenitori'         => 'pages#about_sostenitori'
  get '/about-us/newsletter'          => 'pages#about_newsletter'

  # servizi
  get '/servizi/affitto-spazi'        => 'pages#servizi_affitto_spazi'
  get '/servizi/spazi'                => 'pages#servizi_spazi'
  get '/servizi/biblioteca'           => 'pages#servizi_biblioteca'
  get '/servizi/biblioteca-test'      => 'pages#servizi_biblioteca_test'
  get '/servizi/aula-studio'          => 'pages#servizi_aula_studio'
  get '/servizi/spazi'                => 'pages#servizi_spazi'
  
  get '/progetti-di-impatto'                                    => 'special_projects#index', as: :progetti_speciali
  get '/progetti-di-impatto/:slug'                              => 'special_projects#show',  as: :special_project
  
  get '/progetti-culturali'                                    => 'cultural_projects#index', as: :cultural_projects
  get '/progetti-culturali/:slug'                              => 'cultural_projects#show',  as: :cultural_project

  # Redirect from old "Progetti Speciali" to "Progetti d'impatto"
  get '/progetti-speciali',           to: redirect('/progetti-di-impatto', status: 302)
  get '/progetti-speciali/:slug',     to: redirect('/progetti-di-impatto/%{slug}', status: 302)
  
  # Membership
  get '/membership' => 'pages#membership'

  get '/sitemap'    => 'sitemaps#index'

  # Error pages
  get '/404', to: 'errors#not_found'
  get '/422', to: 'errors#unacceptable'
  get '/500', to: 'errors#internal_error'
  # get '/errore', to: 'errors#errore'
end
