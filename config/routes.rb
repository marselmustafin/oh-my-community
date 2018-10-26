Rails.application.routes.draw do
  match "(*any)", to: redirect(subdomain: ""), via: :all, constraints: { subdomain: "www" }

  mount RailsAdmin::Engine => "/admin_dashboard", as: "rails_admin"

  devise_for :admins
  devise_for :users,
    controllers: { registrations: "users/registrations" },
    skip: %i[session password invitation]

  constraints CommunitySubdomainConstraint do
    devise_for :users,
      controllers: {
        registrations: "users/registrations",
        confirmations: "users/confirmations",
        invitations: "users/invitations"
      }

    authenticated :user do
      resources :posts, except: :index do
        resources :comments, except: %i[index show]
        resources :ratings, only: :create
      end

      resource :community, only: %i[show edit update destroy]
      resources :users, only: :index

      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
