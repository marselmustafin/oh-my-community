Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }, skip: %i[session password]

  constraints CommunitySubdomainConstraint do
    devise_for :users, controllers: { registrations: "users/registrations" }

    authenticated :user do
      resources :posts, except: :index do
        resources :comments, only: %i[create update destroy]
        resources :ratings, only: :create
      end

      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
