Rails.application.routes.draw do
  devise_for :users
  root to:"gests#index"
  get 'gests/search/index', to: 'gests#search_index'
  get 'gests/search', to: 'gests#search'
  resources :gests
end
