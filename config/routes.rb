Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin_dashboard", as: "rails_admin"
  devise_for :admins
  devise_for :users, controllers: { registrations: "users/registrations" }, skip: %i[session password]

  authenticated :admin do
    root to: "rails_admin/main#dashboard"
  end

  constraints CommunitySubdomainConstraint do
    devise_for :users, controllers: { registrations: "users/registrations" }

    authenticated :user do
      resources :posts, except: :index do
        resources :comments, only: %i[create update destroy]
        resources :ratings, only: :create
      end

      resources :users, only: :index

      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
