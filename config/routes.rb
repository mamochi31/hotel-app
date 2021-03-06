Rails.application.routes.draw do
  devise_for :users
  root to:"gests#index"
  get 'gests/search/index', to: 'gests#search_index'
  get 'gests/search', to: 'gests#search'
  get 'gests/code/search/sex', to: 'gests#code_search_sex'
  get 'gests/code/search/rank', to: 'gests#code_search_rank'
  get 'gests/code/search/room_type', to: 'gests#code_search_room_type'
  get 'gests/code/search/area', to: 'gests#code_search_area'
  get 'gests/code/search/tag', to: 'gests#code_search_tag'
  get 'gests/code/search/plan', to: 'gests#code_search_plan'
  get 'gests/show/plan', to: 'gests#show_plan'
  get 'sexes/search', to: 'sexes#search'
  get 'ranks/search', to: 'ranks#search'
  get 'room_types/search', to: 'room_types#search'
  get 'plans/search', to: 'plans#search'
  get 'tags/search', to: 'tags#search'
  get 'areas/search', to: 'areas#search'
  resources :gests
  resources :sexes
  resources :ranks
  resources :room_types
  resources :plans
  resources :tags
  resources :areas
end