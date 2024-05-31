Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "about", to:"about#index"
  
  get "sign_up", to:"registrations#new"

  post"sign_up", to:"registrations#create"

  get "cardz/new", to:"cardz#new"
  post "cardz/new", to:"cardz#create"

  get "cardz", to:"cardz#index"

  get "cardz/edit", to:"cardz#edit"
  post"cardz/edit", to:"cardz#update"
 
  delete "cardz_delete", to:"cardz#destroy"

  get "sign_in", to:"sessions#new"

  post"sign_in", to:"sessions#create"

  delete "logout", to:"sessions#destroy"

  get "password", to:"passwords#edit", as: :edit_password
  patch "password", to:"passwords#update", as: :update_password

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  
  
  root to:"home#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
