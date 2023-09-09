class Teacher::ClassesController < ApplicationController
  def index
    @lessons = current_teacher.lessons.page(params[:page]).per(10).order(start_time: :asc)
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(classes_params)
      @lesson.shift.update(status: 4)
      redirect_to teacher_class_path(@lesson)
    else
      render :show
    end
  end

  private

  def classes_params
    params.require(:lesson).permit(:teacher_comment)
  end
end
