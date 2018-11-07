require "rails_helper"

feature "Sign Out" do
  include_context "current user signed in"

  def click_hidden_header_toggler
    page.find("#hidden-header-toggler").click
  end

  scenario "User signs out" do
    visit_community current_community

    click_hidden_header_toggler
    click_link "Sign out"

    expect(page).to have_content("Signed out successfully.")
  end
end
