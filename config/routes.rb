# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/index'

  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :friendships, only: [:index, :show, :create, :destroy] do
    collection do
      post 'confirm'
    end
  end
end
