class Admin::MediasController < ApplicationController
  before_action :authenticate_admin!
  def index
    @medias = MediaPost.page(params[:page]).per(10).order("date_public "+ sort_direction)
    @media = MediaPost.new
  end

  def edit
    @media = MediaPost.find(params[:id])
  end

  def create
    @media = MediaPost.new(media_post_params)
    if @media.save
      redirect_to admin_medias_path
    else
      @medias = MediaPost.page(params[:page]).per(10).order("date_public "+ sort_direction)
      render :index
    end
  end

  def update
    @media = MediaPost.find(params[:id])
    if @media.update(media_post_params)
      redirect_to admin_medias_path
    else
      render :edit
    end
  end

  def destroy
    @media = MediaPost.find(params[:id])
    @media.destroy
    redirect_to admin_medias_path
  end
  # 入力内容に誤りがあった場合、
  # 入力内容を保持したまま前のページに戻るのが当たり前になっているかと思いますが、
  # backアクションを定義することで可能となります。
  def back
    @media = MediaPost.new(contact_params)
    render :new
  end

  private
  def sort_direction
    # If params[:direction] is nil, set sort_direction to "desc" by default
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def media_post_params
    params.require(:media_post).permit(:title, :url,:date_public,:genre)
  end

end

