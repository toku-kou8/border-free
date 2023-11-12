class Teacher::HomesController < ApplicationController
  before_action :authenticate_teacher!
  def top
    @shifts = current_teacher.shifts.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
  end

  def edit
    @teacher = current_teacher
    @subjects = @teacher.subjects
    @subject = SubjectTeacher.new
  end

  def create
    @subject = SubjectTeacher.new(subject_teacher_params)
    @subjects = current_teacher.subjects
    @subject.teacher_id = current_teacher.id
    #すでに登録されていたら戻る
    if current_teacher.subject_teachers.find_by(subject_id: params[:subject_teacher][:subject_id]).present?
      render :edit
    elsif @subject.save
      redirect_to teacher_home_edit_path
    else
      render :edit
    end
  end

  def destory
    @subject = SubjectTeacher.where(teacher_id: current_teacher.id).find_by(subject_id: params[:id])
    @subject.destroy
    redirect_to teacher_home_edit_path
  end

  def update
    @teacher = current_teacher
    if @teacher.update(teacher_params)
      redirect_to teacher_top_path
    else
      @subjects = @teacher.subjects
      @subject = SubjectTeacher.new
      render :edit
    end
  end
  private

  def subject_teacher_params
    params.require(:subject_teacher).permit(:subject_id)
  end

  def teacher_params
    params.require(:teacher).permit(:email, :name, :name_kana, :phone_number, :school, :faculty, :birth, :image)
  end
end
