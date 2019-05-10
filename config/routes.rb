Rails.application.routes.draw do
  apipie

  namespace :api do
    namespace :v1 do
      resources :movies, only: %i[index]
    end
  end
end
