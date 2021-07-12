# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "welcome#index"
  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reports, only: [:index, :new, :create]
  resources :videos, only: [:index, :new, :create]
  resources :sites, only: [:index, :new, :create]

  resource :about, only: [:show]

  resources :list_views, only: [:index]

  resources :developer_guides, only: [:index]

  resource :setting, except: [:destroy]
end
