class PagesController < ApplicationController
  skip_before_action :prevent_visiting_null_community_subdomain!

  expose_decorated :communities, -> { Community.all.with_attached_image }

  def home
  end
end
