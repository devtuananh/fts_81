class Trainee::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_course, only: :show

  def index
    @my_courses = Course.trainee_courses(current_user.id)
      .page(params[:page]).per Settings.per_page
  end
   def show; end

   private

   def find_course
    @course = Course.find_by_id params[:id]

    return if @course
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
