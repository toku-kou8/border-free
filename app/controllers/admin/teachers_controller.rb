class Admin::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @shift_time = @teacher.shifts.where("start_time >= ?", Date.today.last_month.beginning_of_month)
  end
end
