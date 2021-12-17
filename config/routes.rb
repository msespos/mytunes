# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :friendships do
    collection do
      post 'create_friend_request'
    end
  end
end
