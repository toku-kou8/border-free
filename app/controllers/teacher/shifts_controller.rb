class Teacher::ShiftsController < ApplicationController
  before_action :authenticate_teacher!
  def index
    @shifts = current_teacher.shifts.where("start_time >= ?",Date.current << 2).order(start_time: :asc)
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(params_shift)
    @shift.teacher_id = current_teacher.id
    hours, minutes = start(@shift.timetable)
    @shift.start_time = @shift.start_time + hours.hour + minutes.minute
    # byebug
    if @shift.save
      redirect_to teacher_shifts_path
    else
      @shifts = current_teacher.shifts.where("start_time >= ?",Date.current << 2).order(start_time: :desc)
      render :index
    end
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(prams_shift)
      redirect_to teacher_shifts_path, notice: "編集しました"
    else
      render :index
    end
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    redirect_to teacher_shifts_path, notice: "削除しました"
  end

  private
  def params_shift
    params.require(:shift).permit(:start_time,:timetable)
  end

  def start(timetable)
  starttime =  [[16,30],
               [17,40],
               [18,50],
               [20,00],
               [13,00],
               [14,10],
               [15,20],
               [16,40]]
    time = starttime[timetable]
    return time[0], time[1]
  end

end
