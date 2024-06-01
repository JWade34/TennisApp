Rails.application.routes.draw do
  get 'match_invites/create'
  get 'match_invites/index'
  get 'profiles/show'
  get 'home/index'
  devise_for :users
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
 end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'home#index'

  resources :profiles, only: [:show]
  resources :match_invites, only: [:new, :create, :index] do
    member do
      patch :accept
    end
  end
end
