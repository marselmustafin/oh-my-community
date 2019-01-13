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
      scope module: :communities do
        resources :posts, only: %i[show new create edit update destroy] do
          resources :comments, only: %i[create edit update destroy]
          resources :ratings, only: :create
        end

        resources :users, only: :index
        resources :users_autocompletions, only: :index
        resources :posts_autocompletions, only: :index
      end

      resource :community, only: %i[show edit update destroy]

      root "communities#show"
    end

    root "communities/preview#show"
  end

  root "pages#home"
end
