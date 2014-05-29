class StaticPagesController < ApplicationController
  def home
    @albums = Album.all

  end

  def help
  end
end
