Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :articles
      post "/signup", to: "auth#signup"
      post "/login", to: "auth#login"
      post "/logout", to: "auth#logout"
    end
  end
end
