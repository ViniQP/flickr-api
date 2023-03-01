class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    @flickr = Flickr.new
    @photos = @flickr.people.getPhotos(user_id: "197852001@N08")
  end
end
