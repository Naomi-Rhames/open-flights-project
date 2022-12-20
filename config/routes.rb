Rails.application.routes.draw do
root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :airlines, param: :slug
      resources :reviews, only: [:create, :destroy]
    end
  end

  get '*path', to: 'pages#index', via: :all # route request that aren't for exisiting path predefined in our API back to our index path
end
