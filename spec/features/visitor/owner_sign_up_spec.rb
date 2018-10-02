require "rails_helper"

feature "Owner Sign Up" do
  let(:full_name) { "Frank Sinatra" }
  let(:email) { "sinatra@mail.com" }
  let(:password) { "123456" }
  let(:password_confirmation) { password }
  let(:company_name) { "Jazz-Club" }
  let(:company_subdomain) { "jazz-club" }

  scenario "Visitor signs up" do
    visit new_user_registration_path

    fill_in("Full Name", with: full_name)
    fill_in("Email", with: email)
    fill_in("Password", with: password)
    fill_in("Password Confirmation", with: password_confirmation)
    fill_in("Community Name", with: company_name)
    fill_in("Community Subdomain", with: company_subdomain)

    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end
