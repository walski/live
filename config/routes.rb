Live::Application.routes.draw do
  resources :contacts

  root 'home#index'
end
