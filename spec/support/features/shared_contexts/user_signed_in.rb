shared_context "current user signed in" do
  let(:current_community) { create :community }
  let(:current_user) { create :user, community: current_community }

  background do
    login_as current_user, scope: :user
  end
end
