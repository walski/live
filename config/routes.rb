Live::Application.routes.draw do
  resources :sessions

  match 'the-preface/contact/:id' => 'contact#show', via: :get

  match "/auth/:provider/callback" => "auth_sessions#create", :via => :get
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match "/signout" => "auth_sessions#destroy", :as => :signout, :via => :get

  match '/buddy' => 'buddy#add_buddy', via: :post
  match '/buddies' => 'buddy#index', via: :get
  match '/buddies/requests' => 'buddy#requests', via: :get
  match '/buddies/:id/accept' => 'buddy#accept', via: :put
  match '/buddies/:id' => 'buddy#deny', via: :delete

  root 'home#index'
end