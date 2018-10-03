require "rails_helper"

feature "Create Rating" do
  include_context "current user signed in"

  let!(:post) { create :post, community: current_community }

  background do
    visit_community current_community, post_path(post)

    find("img[alt='4']").click
  end

  scenario "User rate some post", :js do
    expect(page).to have_content("Your rating successfully submitted!")
  end

  context "User rated this post that he already" do
    background { create :rating, user: current_user, post: post, value: 3 }

    scenario "User rate some post", :js do
      expect(page).not_to have_content("Your rating successfully submitted!")
    end
  end
end
