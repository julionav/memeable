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
  end

  def new
  end

  def popular
    @memes = Meme.all.order(votes_count: :desc)
  end
end
