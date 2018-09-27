class CommunitiesController < ApplicationController
  include CommunityExposion

  expose_decorated :posts, from: :current_community

  def show
  end
end
