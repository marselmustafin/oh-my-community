Rails.application.routes.draw do
  match "(*any)", to: redirect(subdomain: ""), via: :all, constraints: { subdomain: "www" }

  mount RailsAdmin::Engine => "/admin_dashboard", as: "rails_admin"

  devise_for :admins
  devise_for :users,
    controllers: {
      registrations: "users/registrations",
      omniauth_callbacks: "users/omniauth_callbacks"
    },
    skip: %i[session password invitation]

  constraints CommunitySubdomainConstraint do
    devise_for :users,
      controllers: {
        registrations: "users/registrations",
        confirmations: "users/confirmations",
        invitations: "users/invitations"
      },
      skip: %i[omniauth_callbacks]

    authenticated :user do
      resources :posts, except: :index do
        resources :comments, except: %i[index show]
        resources :ratings, only: :create
      end

      resource :community, except: %i[new create index]
      resources :users, only: :index

      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
