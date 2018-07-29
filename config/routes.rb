Rails.application.routes.draw do

  api_version(:module => "Api::V1", path: {value: "api/v1"}) do

    resources :guests

    # mount_devise_token_auth_for 'User', at: '/auth/users', skip: [:omniauth_callbacks, :confirmations], controllers: {
    #     sessions: 'api/v1/users/sessions',
    #     registrations: 'api/v1/users/registrations'
    #   }
    # resources :roles, only: [:index, :create, :show, :update, :destroy]
    # resources :profiles
    # resource :users, only: [:show, :update, :destroy] do
    #   post :validate_username
    #   get :me
    # end
    # resources :links, only: [:create, :update, :destroy]
    # resources :vision_board_items, only: [:show, :create, :update, :destroy]
    # resources :inspiration_items, only: [:create, :update, :destroy]
    # resources :background_items, only: [:create, :update, :destroy]
    # resources :profile_skills, only: [:create, :update, :destroy]
    # resources :attachments, only: [:create, :destroy]
    # resources :industries, only: [:index]
    # get '/companies', to: 'companies#search'
    # get '/schools', to: 'companies#schools'
    # get '/users/industries',to: 'users#industries'
    # get '/search/:query', to: 'search#index'
  end

  # api_version(:module => "Api::V2", path: {value: "api/v2"}) do
  #   mount_devise_token_auth_for 'User', at: '/auth/users', skip: [:omniauth_callbacks, :confirmations], controllers: {
  #       sessions: 'api/v2/users/sessions',
  #       registrations: 'api/v2/users/registrations'
  #     }
  #   resources :roles, only: [:index, :create, :show, :update, :destroy]
  #   resources :profiles do
  #     get '/:id/background_items',to: 'background_items#background_items',on: :collection
  #     get '/:id/inspiration_items',to: 'inspiration_items#inspiration_items',on: :collection
  #     get '/:id/profile_skills',to: 'profile_skills#profile_skills',on: :collection
  #     get '/:id/vision_board_items',to: 'vision_board_items#vision_board_items',on: :collection
  #   end

  #   resource :users, only: [:show, :update, :destroy] do
  #     post :validate_username
  #     get :set_participant_identity,to: "users#set_participant_identity",on: :collection
  #     get :participant_identity, to: "users#participant_identity",on: :collection
  #     get :me
  #   end
  #   resources :links, only: [:create, :update, :destroy]
  #   resources :vision_board_items, only: [:show, :create, :update, :destroy]
  #   resources :inspiration_items, only: [:create, :update, :destroy]
  #   resources :background_items, only: [:create, :update, :destroy]
  #   resources :profile_skills, only: [:create, :update, :destroy]
  #   resources :attachments, only: [:create, :destroy]
  #   resources :industries, only: [:index]
  #   resources :groups
  #   resources :layer_conversations do
  #     get 'layer_authenticate',to: 'layer_conversations#layer_authenticate'
  #     delete '/:id/remove_member',to: 'layer_conversations#destroy',on: :collection,as: :remove_member
  #   end
  #   get '/groups/:id/members', to: 'groups#members'
  #   post '/groups/:id/join',to: 'groups#join'
  #   post '/groups/:id/leave',to: 'groups#leave'
  #   get '/groups/joined',to: 'groups#joined'
  #   get '/companies', to: 'companies#search'
  #   get '/schools', to: 'companies#schools'
  #   get '/users/industries',to: 'users#industries'
  #   get '/search/:query', to: 'search#index'
  # end

  # devise_for :users, skip: [:confirmations], controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks',
  #   sessions:           'users/sessions',
  #   registrations:      'users/registrations',
  #   passwords:          'users/passwords'
  # }

  # devise_scope :user do
  #   post '/users/omniauth_callbacks/complete_profile', as: :complete_profile_registration
  # end

  # resource :profiles do
  #   get :featured, on: :collection
  # end

  # get '/search', to: 'application#search', as: 'search'
  # get '/not-user', to: 'application#not_user', as: 'not_user'
  # get '/home', to: 'application#home'
  # get :'/:username', to: 'profiles#show', as: 'user'

  # root 'application#index'

end
