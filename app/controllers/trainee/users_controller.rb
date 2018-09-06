class Trainee::UsersController < ApplicationController
  before_action :find_user, only: :show

  def show; end

  def all_users
    @members = User.members.page(params[:page]).per Settings.per_page
  end

  private
  def find_user
    @user = User.find_by_id params[:id]
    return if @user
    flash[:danger] = t ".message.not_found"
    redirect_to root_path
  end
end
