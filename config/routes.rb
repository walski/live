Live::Application.routes.draw do
  resources :sessions

  root 'home#index'
end