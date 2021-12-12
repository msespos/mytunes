# frozen_string_literal: true

Rails.application.routes.draw do
  get 'friendships/create'
  get 'friendships/destroy'
  get 'users/index'
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
