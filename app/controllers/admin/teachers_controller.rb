class Admin::TeachersController < ApplicationController
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @shift_time = @teacher.shifts
  end
end
