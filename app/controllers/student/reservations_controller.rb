class Student::ReservationsController < ApplicationController
  def index
    @shifts = @shifts = current_teacher.shifts.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
  end

  def create
  end

  def update
  end
end
