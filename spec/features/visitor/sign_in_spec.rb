require "rails_helper"

feature "Sign In" do
  let!(:community) { create :community }
  let(:user) { create :user, community: community }

  def sign_in(email, password)
    visit_community community, new_user_session_path

    fill_in("Email", with: email)
    fill_in("Password", with: password)
    click_button "Sign in"
  end

  scenario "Visitor signs in with valid credentials" do
    sign_in(user.email, user.password)

    expect(page).to have_content(user.full_name)
  end

  scenario "Visitor signs in with invalid credentials" do
    sign_in(user.email, "wrong password")

    expect(page).to have_content("Sign in")
    expect(page).to have_content("Invalid Email or password")
  end
end
