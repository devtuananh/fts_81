class Supervisor::CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update]

  def index
    @courses = Course.all_courses.page(params[:page]).per Settings.per_page
  end

  def new
    @course = Course.new
    Settings.course_times.times do
      subject = @course.subjects.build
      Settings.task_times.times do
        subject.tasks.build
      end
    end
  end

  def create
    @course = Course.new course_params

    if @course.save
      @course.passive_admin_courses.create user_id: current_user.id
      flash[:success] = t ".create_success"
      redirect_to supervisor_courses_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @course.update_attributes course_params
      flash[:success] = t ".update_success"
      redirect_to supervisor_courses_path
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  private

  def find_course
    @course = Course.find_by_id params[:id]

    return @course
    flash[:danger] = t ".not_found"
    redirect_to supervisor_courses_path
  end

  def course_params
    params.require(:course).permit :id, :name, :description, :start_time, :end_time,
      :status, subjects_attributes: [:id, :name, :description, :start_time,
      :end_time, :destroy, tasks_attributes: [:id, :name, :description, :content,
      :destroy]]
  end
end
