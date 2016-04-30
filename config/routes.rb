Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      post 'users/register', to: 'users#create'
      post 'users', to: 'users#login'
      patch 'users', to: 'users#update'
      delete 'users', to: 'users#destroy'

      resources :locations, only: [:index, :show, :create ] do
        resources :ratings, only: [:create, :show], on: :member
      end
    end
  end

end
