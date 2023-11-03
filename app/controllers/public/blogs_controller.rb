class Public::BlogsController < ApplicationController
  def show
    @blog = Blog.find(params[:id])
  end

  def index
    @blogs = Blog.page(params[:page]).per(10)
  end
end
