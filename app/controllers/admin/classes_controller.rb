class Admin::ClassesController < ApplicationController
  def subject
    @subject = Subject.new
    @subjects = Subject.all
  end

  def subcreate
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to admin_subject_path
    else
      @subjects = Subject.all
      render :subject
    end
  end

  def destory
    @subject = Subject.find(params[:id])
    @subject.destry
    redirect_to admin_subject_path
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :grade)
  end
end