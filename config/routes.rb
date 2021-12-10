Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end
