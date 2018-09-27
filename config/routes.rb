Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  constraints CommunitySubdomainConstraint do
    authenticated :user do
      resources :posts, except: :index do
        resource :rating, only: :create
      end

      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
