class Supervisor::SubjectsController < ApplicationController
  before_action :find_course, only: [:new, :create]

  def new
    @subject = Subject.new
    Settings.task_times.times do
      @subject.tasks.build
    end
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save!
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fail"
    end
    redirect_to supervisor_courses_path
  end

  private

  def subject_params
    params.require(:subject).permit :id, :name, :description, :start_time, :end_time,
      :course_id, tasks_attributes: [:id, :name, :description, :content, :destroy]
  end

  def find_course
    @course = Course.find_by_id params[:course_id]

    return @course
    flash[:danger] = t ".not_found"
    redirect_to supervisor_courses_path
  end
end
