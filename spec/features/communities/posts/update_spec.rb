require "rails_helper"

feature "Update Post" do
  include_context "current user signed in"

  let!(:post) { create :post, title: "My Story", community: current_community, author: current_user }

  let(:title) { "My Super Story!" }

  def fill_trix_form_with(text)
    find("trix-editor").click.set(text)
  end

  background { visit_community current_community, edit_post_path(post) }

  scenario "User updates post" do
    fill_in "Title", with: title
    fill_trix_form_with text

    click_on "Update Post"

    expect(page).to have_content("Post was successfully updated.")
  end
end
