class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    @flickr = Flickr.new

    unless params[:user_id].blank?
      @photos = @flickr.people.getPhotos(user_id: params[:user_id], per_page: 10)
      @info = @flickr.people.getInfo(user_id: @photos.first.owner)
    else
      @photos = @flickr.galleries.getPhotos(gallery_id: "72157720878919558")
    end
  end

  private
    def get_userid
      params.permit(:user_id)
    end
end
