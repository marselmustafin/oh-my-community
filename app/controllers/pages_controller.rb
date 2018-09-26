class PagesController < ApplicationController
  skip_before_action :prevent_null_community_subdomain!

  expose_decorated :communities, -> { Community.all }

  def home
  end
end
