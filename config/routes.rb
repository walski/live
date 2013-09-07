Live::Application.routes.draw do
  resources :contacts

  root 'contacts#index'
end
