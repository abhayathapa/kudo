Rails.application.routes.draw do
  devise_for :users
  resources :stand_ups
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "stand_ups#index"
end
