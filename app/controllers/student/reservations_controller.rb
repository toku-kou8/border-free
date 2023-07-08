class Student::ReservationsController < ApplicationController
  before_action :authenticate_student!
  def index
    @shifts = Shift.all.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
    @lessons = current_student.lessons.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.student_id = current_student.id
    if @lesson.save
      shift = Shift.find(params[:shift_id])
      shift.update(status: 2)
      redirect_to student_reservations_path
    else
      @shifts = Shift.all.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
      @lessons = current_student.lessons.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)
      render :index
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy
      shift = Shift.find(@lesson.shift_id)
      shift.update(status: 0)
    end
    redirect_to student_reservations_path
  end

  def update
  end

  private

  def lesson_params
    params.require(:lesson).permit(:teacher_id, :subject_id, :start_time, :timetable, :shift_id)
  end
end
