require "rails_helper"

feature "Member Sign Up" do
  let(:community) { create :community }

  let(:full_name) { "Frank Sinatra" }
  let(:email) { "sinatra@mail.com" }
  let(:password) { "123456" }
  let(:password_confirmation) { password }

  scenario "Visitor signs up" do
    visit_community community, new_user_registration_path

    fill_in("Full Name", with: full_name)
    fill_in("Email", with: email)
    fill_in("Password", with: password)
    fill_in("Password Confirmation", with: password_confirmation)

    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end
