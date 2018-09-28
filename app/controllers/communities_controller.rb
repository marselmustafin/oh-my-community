class CommunitiesController < ApplicationController
  expose_decorated :posts, from: :current_community

  def show
  end
end
