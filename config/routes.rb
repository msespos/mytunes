# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'

  devise_for :users, controllers: { registrations: 'registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: %i[show edit update]

  resources :friendships, only: %i[index show create destroy] do
    collection do
      post 'confirm'
    end
  end

  resources :posts, only: :index

  resources :text_posts, only: %i[new create] do
    collection do
      post 'like'
      post 'comment'
    end
  end

  resources :image_posts, only: %i[new create] do
    collection do
      post 'like'
      post 'comment'
    end
  end
end
