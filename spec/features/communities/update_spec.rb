require "rails_helper"

feature "Update Community" do
  include_context "current user signed in" do
    let(:current_community) { create :community, name: "Community" }
    let(:current_user) { create :user, :owner, community: current_community }
  end

  let(:community_name) { "Nice Community" }

  background { visit_community current_community, edit_community_path(current_community) }

  scenario "User updates community" do
    fill_in("Community Name", with: community_name)
    click_on "Update Community"

    expect(page).to have_content(community_name)
  end
end
