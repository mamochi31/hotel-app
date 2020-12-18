Rails.application.routes.draw do
  devise_for :users
  root to:"gests#index"
  resources :gests
end
