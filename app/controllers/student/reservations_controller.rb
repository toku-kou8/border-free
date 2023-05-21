class Student::ReservationsController < ApplicationController
  before_action :authenticate_student!
  def index
    @shifts = @shifts = current_student.shifts.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
  end

  def create
  end

  def update
  end
end
