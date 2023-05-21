class Admin::ShiftsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @shifts = Shift.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
  end

  def update
    @shift = Shift.find(params[:id])
    status_new = params[:status]
    if @shift.update(status: status_new)
      redirect_to admin_shifts_path
    else
      @shifts = Shift.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
      render :index
    end
  end


end
