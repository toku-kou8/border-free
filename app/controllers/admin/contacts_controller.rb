class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).per(10).order("created_at "+ sort_direction)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private
  def sort_direction
    # If params[:direction] is nil, set sort_direction to "desc" by default
    %W[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
