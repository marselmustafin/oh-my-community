require "rails_helper"

feature "Search Users" do
  include_context "current user signed in"

  background do
    create :user, full_name: "John Travolta", community: current_community
    create :user, full_name: "Martin Frank", community: current_community

    visit_community current_community, users_path
  end

  def fill_search_input_with(query)
    fill_in("user-search-input", with: query)
  end

  scenario "User searches some users" do
    fill_search_input_with("Travolta")
    click_on "Apply"

    expect(page).to have_content("JOHN TRAVOLTA")
    expect(page).not_to have_content("Martin Frank")
  end
end
