require "rails_helper"

feature "Admin Sign In" do
  let(:admin) { create :admin }

  def sign_in(email, password)
    visit new_admin_session_path

    fill_in("Email", with: email)
    fill_in("Password", with: password)
    click_button "Sign in"
  end

  scenario "Admin signs in with valid credentials" do
    sign_in(admin.email, admin.password)

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "Admin signs in with invalid credentials" do
    sign_in(admin.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end
end
