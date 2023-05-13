class Teacher::HomesController < ApplicationController
  before_action :authenticate_teacher!
  def top
      @shifts = current_teacher.shifts.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
  end
end
