Rails.application.routes.draw do
  devise_for :users
  root to:"gests#index"
  get 'gests/search/index', to: 'gests#search_index'
  get 'gests/search', to: 'gests#search'
  get 'gests/code/search/sex', to: 'gests#code_search_sex'
  get 'gests/code/search/rank', to: 'gests#code_search_rank'
  get 'gests/code/search/room_type', to: 'gests#code_search_room_type'
  get 'gests/code/search/area', to: 'gests#code_search_area'
  resources :gests
  resources :sexes
  resources :ranks
  resources :room_types
  resources :plans
  resources :tags
  resources :areas
end