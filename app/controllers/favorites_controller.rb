class FavoritesController < ApplicationController
  def create
    user=current_user
    feed=feed.find(params[:feed_id])
    if Favorite.create(user_id: user.id,feed_id:feed.id)
      redirect_to feed
    else
      redirect_to root_url
    end
  end
    
  def destroy
    user=current_user
    feed=feed.find(params[:feed_id])
    if favorite=Favorite.find_by(user_id: user.id,feed_id:feed.id)
      favorite.delete
      redirect_to users_path(current_user)
    else
      redirect_to root_url
    end
  end
end