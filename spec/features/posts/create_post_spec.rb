require "rails_helper"

feature "Create Post" do
  include_context "current user signed in"

  let(:title) { "My Story" }
  let(:text) { "Today was a good day" }

  def fill_trix_form_with(text)
    find("trix-editor").click.set(text)
  end

  background { visit_community current_community, new_post_path }

  scenario "User creates post" do
    fill_in "Title", with: title
    fill_trix_form_with text

    click_on "Create Post"

    expect(page).to have_content("Post was successfully created.")
  end
end
