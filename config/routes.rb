Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  constraints RootSubdomainConstraint do

  end

  constraints CommunitySubdomainConstraint do
    authenticated :user do
      root "communities#show"
    end

    root "preview#show"
  end

  root "pages#home"
end
