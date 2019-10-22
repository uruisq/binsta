class FeedsController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  def index
    @feeds = Feed.all
  end

  def new
    if params[:back]
      @feed = Feed.new(feed_params)
    else
      @feed = Feed.new
    end
  end

  def create
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feedしました' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def confirm
    @feed = Feed.new(feed_params)
    @feed.user_id = current_user.id
    render :new if @feed.invalid?
  end

  def edit
  end

  def update
    respond_to do |format|
      if @feed.update(feed_params)
      format.html { redirect_to @feed, notice: 'Feedを編集しました' }
      else
      format.html { render :edit }
      end
    end
  end

  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feedを削除しました' }
    end
  end

  private

  def feed_params
    params.require(:feed).permit(:title, :content, :image, :image_cache)
  end

  def set_feed
    @feed = Feed.find(params[:id])
  end

  def correct_user
    feed = Feed.find(params[:id])
    if current_user.id != feed.user.id
      redirect_to feeds_path
    end
  end

end
