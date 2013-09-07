Live::Application.routes.draw do
  resources :contacts
  resources :sessions

  root 'contacts#index'
end
