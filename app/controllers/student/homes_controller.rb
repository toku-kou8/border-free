class Student::HomesController < ApplicationController
  def index
    @student = current_student
    @classes = @student.classes.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
  end

  def edit
  end

  def update
  end
end
