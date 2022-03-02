# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :web do
    root 'bulletins#index'
    
    post 'auth/:provider', to: 'auth#request', as: :auth_request
    get 'auth/:provider/callback', to: 'auth#callback', as: :callback_auth
    
    resources :bulletins
    
    namespace 'admin', as: 'admin' do
      root 'bulletins#index'
      resources :bulletins, only: %i[index edit delete show]
      resources :categories, only: %i[index edit delete show]
      resources :users, only: %i[index edit delete show]
    end
  end
end
