class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @my_courses = Course.trainee_courses(current_user.id)
      .page(params[:page]).per Settings.per_page
  end
end
