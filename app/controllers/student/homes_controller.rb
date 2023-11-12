class Student::HomesController < ApplicationController
  def index
    @student = current_student
    @lessons = current_student.lessons.where("start_time >= ?",Date.current << 2).where("status == ?", 0).order(start_time: :asc)

    # @classes = @student.classes.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
  end

  def edit
    @student = current_student
  end

  def update
    @student = current_student
    if @student.update(student_params)
      redirect_to student_show_path, notice: "修正しました"
    else
      render :edit
    end
  end

  private

  def student_params
    params.require(:student).permit(:email, :name, :name_kana, :phone_number, :parent_name, :parent_name_kana, :birth)
  end
end
