class Public::MediasController < ApplicationController
  def index
    @medias = MediaPost.page(params[:page]).per(10).order("date_public "+ sort_direction)
  end

  private
  def sort_direction
    # If params[:direction] is nil, set sort_direction to "desc" by default
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
