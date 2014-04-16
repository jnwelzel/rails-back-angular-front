RailsApiAngularClient::Application.routes.draw do
  get 'home/index'
  root 'home#index'
  namespace :api, defaults: {format: :json} do
    resources :posts, only: [:index, :create, :update, :destroy]
  end
end
