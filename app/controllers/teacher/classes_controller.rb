class Teacher::ClassesController < ApplicationController
  def index
    @lessons = current_teacher.lessons.order(start_time: :asc)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end
end
