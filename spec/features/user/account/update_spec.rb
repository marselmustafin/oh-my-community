require "rails_helper"

feature "Update Account" do
  include_context "current user signed in"

  let(:full_name) { "Frank Sinatra" }
  let(:email) { "sinatra@mail.com" }
  let(:password) { "123456" }

  background do
    visit_community current_community, edit_user_registration_path(current_user)
  end

  scenario "User updates account with valid data" do
    fill_in("Full Name", with: full_name)
    fill_in("Email", with: email)
    fill_in("Password", with: password)
    click_on "Update"

    expect(page).to have_content("updated successfully")
  end
end
