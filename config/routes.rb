Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index] do
        get :tv_shows, on: :collection
        get :all, on: :collection
      end
      resources :user_token, only: %i[create]
    end
  end
end
