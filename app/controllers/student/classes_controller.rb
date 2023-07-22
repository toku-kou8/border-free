class Student::ClassesController < ApplicationController
  def index
    @lessons = current_student.lessons
  end

  def create
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def update
  end
end
