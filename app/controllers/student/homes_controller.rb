class Student::HomesController < ApplicationController
  def index
    @student = current_student
    @lessons = current_student.lessons.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
    
    # @classes = @student.classes.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
  end

  def edit
  end

  def update
  end
end
