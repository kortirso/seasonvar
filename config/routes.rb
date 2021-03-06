Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index] do
        get :tv_shows, on: :collection
        get :all, on: :collection
      end
      resources :user_token, only: %i[create]
      resources :purchases, only: %i[create]
      resources :users, only: %i[] do
        get :library, on: :collection
      end
    end
  end
end
