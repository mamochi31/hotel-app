Rails.application.routes.draw do
  get 'gests/index'
  root to:"gests#index"
end
