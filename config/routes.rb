Rails.application.routes.draw do
  root to:"gests#index"
  resources :gests
end
