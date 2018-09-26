class PagesController < ApplicationController
  expose_decorated :communities, -> { Community.all }

  def home
  end
end
