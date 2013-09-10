Live::Application.routes.draw do
  resources :trips
  resources :sessions

  root 'home#index'
end
