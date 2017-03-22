Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :guests, only: [:index, :show] do
    resources :appearances, only: [:new,:create]
  end
  resources :episodes, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'

  # also creating a logout for my sanity
  get '/logout', to: 'sessions#destroy'
end
