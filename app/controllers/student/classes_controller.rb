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
    @lesson = Lesson.find(params[:id])
    if @lesson.update(classes_params)
      redirect_to student_class_path(@lesson)
    else
      render :show
    end
  end

  private

  def classes_params
    params.require(:lesson).permit(:student_comment, :star)
  end
end
