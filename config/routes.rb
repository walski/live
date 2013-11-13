Live::Application.routes.draw do
  resources :sessions

  match 'the-preface/contact/:id' => 'contact#show', via: :get
  root 'home#index'
end