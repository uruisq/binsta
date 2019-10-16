class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @feed = Feed.find(params[:micropost_id])
    unless @feed.iine?(current_user)
      @feed.iine(current_user)
      @feed.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @feed = Favotite.find(params[:id]).feed
    if @feed.iine?(current_user)
      @feed.uniine(current_user)
      @feed.reload
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end