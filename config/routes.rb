# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  # WHAT ABOUT DESTROY_FRIEND_REQUEST? IT'S WORKING BUT NOT HERE
  resources :friendships, only: [:index, :create, :destroy]
end
