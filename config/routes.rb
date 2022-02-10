# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'

  devise_for :users, controllers: { registrations: 'registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    root to: 'devise/sessions#new'
    get '/users', to: 'devise/registrations#new'
  end

  resources :users, only: %i[show edit update]

  resources :friendships, only: %i[index show create destroy] do
    collection do
      post 'confirm'
    end
  end

  resources :posts, only: :index do
    collection do
      post 'like'
      delete 'unlike'
      post 'comment'
    end
  end

  resources :text_posts, only: %i[new create]

  resources :image_posts, only: %i[new create]

  resources :audio_posts, only: %i[new create]
end
