require "rails_helper"

feature "Cancel Account" do
  include_context "current user signed in"

  background do
    visit_community current_community, edit_user_registration_path(current_user)
  end

  let(:email) { current_user.email }
  let(:password) { current_user.password }

  scenario "User cancels account" do
    click_link "Cancel my account"

    accept_alert

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")

    visit_community current_community, new_user_session_path

    fill_in("Email", with: email)
    fill_in("Password", with: password)

    click_button "Sign in"

    expect(page).to have_content("Invalid Email or password.")
  end
end
