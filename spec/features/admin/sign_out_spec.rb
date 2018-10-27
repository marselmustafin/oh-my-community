require "rails_helper"

feature "Admin Sign Out" do
  include_context "current admin signed in"

  scenario "Admin signs out" do
    visit rails_admin_path

    click_link "Log out"

    expect(page).to have_content("Signed out successfully.")
  end
end
