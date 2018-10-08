Rails.application.routes.draw do
  mount RailsAdmin::Engine => "/admin_dashboard", as: "rails_admin"

  devise_for :admins
  devise_for :users, controllers: { registrations: "users/registrations" }, skip: %i[session password]

  constraints CommunitySubdomainConstraint do
    devise_for :users, controllers: { registrations: "users/registrations" }

    authenticated :user do
      resources :posts, except: :index do
        resources :comments, except: %i[index show]
        resources :ratings, only: :create
      end

      resources :users, only: :index

      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
