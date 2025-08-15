Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :lists, only: [:index, :show, :new, :create, :destroy] do
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
