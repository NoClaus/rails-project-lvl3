# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :web do
    root 'bulletins#index'
    
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    match 'auth/:provider/callback', to: 'auth#callback', via: %i[get post], as: :callback_auth

    resource :session, only: :destroy
    resources :bulletins do
      member do
        patch 'to_moderate'
        patch 'archive'
      end
    end
    namespace 'admin' do
      root 'bulletins#index'
      resources :bulletins do
        member do
          patch 'to_moderate'
          patch 'publish'
          patch 'archive'
          patch 'reject'
        end
      end
      resources :categories
      resources :users
    end
    get 'profile', to: 'profile#index'
  end
end