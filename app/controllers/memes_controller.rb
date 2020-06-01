# /popular
class MemesController < ApplicationController
  def index
    memes = Meme.all.order(created_at: :desc)
    @memes_by_date = memes.group_by { |meme| meme.created_at.to_date }
  end

  def show
    @meme = Meme.find(params[:id])
    @comment = Comment.new
  end

  def create
    @meme = current_user.memes.new(meme_params)
    if @meme.save
      redirect_to meme_path(@meme)
    else
      render "new"
    end
  end

  def new
    @meme = Meme.new
  end

  def popular
    @memes = Meme.all.order(votes_count: :desc)
  end

  private

  def meme_params
    params.require(:meme).permit(:title, :url_source, :type, :category_id)
  end
end
