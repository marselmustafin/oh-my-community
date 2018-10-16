require "rails_helper"

feature "Create Comment" do
  include_context "current user signed in" do
    let(:current_user) { create :user, :owner, community: current_community }
  end

  background { visit_community current_community, edit_community_path(current_community) }

  scenario "User destroys community" do
    click_on "Delete community"
    accept_alert

    expect(page).not_to have_content(current_community.name)
  end
end
