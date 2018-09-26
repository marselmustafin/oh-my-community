class PagesController < ApplicationController
  skip_before_action :require_community!

  expose_decorated :communities, -> { Community.all }

  def home
  end
end
