require "rails_helper"

feature "Create Rating" do
  include_context "current user signed in"

  let!(:post) { create :post, community: current_community }

  background do
    visit_community current_community, post_path(post)
  end

  scenario "User rate some post" do
    find("img[alt='4']").click

    expect(page).to have_content("Your rating successfully submitted!")
  end

  context "User rated this post that he already" do
    background do
      create :rating, user: current_user, post: post, value: 3
      reload_page
    end

    scenario "User try to rate post that he already rated" do
      find("img[alt='4']").click

      expect(page).not_to have_content("Your rating successfully submitted!")
    end
  end
end
