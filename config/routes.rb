Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: [:destroy]
end
#          Prefix Verb   URI Pattern                            Controller#Action
#     restaurants GET    /restaurants(.:format)                 restaurants#index
#  new_restaurant GET    /restaurants/new(.:format)             restaurants#new
#                 POST   /restaurants(.:format)                 restaurants#create
#      restaurant GET    /restaurants/:id(.:format)             restaurants#show
# edit_restaurant GET    /restaurants/:id/edit(.:format)        restaurants#edit
#                 PATCH  /restaurants/:id(.:format)             restaurants#update
#                 DELETE /restaurants/:id(.:format)             restaurants#destroy
