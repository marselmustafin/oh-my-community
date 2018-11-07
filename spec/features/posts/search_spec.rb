require "rails_helper"

feature "Search Posts" do
  include_context "current user signed in"

  background do
    create :post, title: "Hacking tutorial"
    create :post, title: "My story"

    visit_community current_community, root_path
  end

  def fill_search_input_with(query)
    fill_in("search-input", with: query)
  end

  def submit_search_form
    find("#search-input").native.send_keys(:return)
  end

  scenario "User searches some posts" do
    fill_search_input_with("Hacking")
    submit_search_form

    expect(page).to have_content("Hacking")
    expect(page).not_to have_content("My story")
  end
end
