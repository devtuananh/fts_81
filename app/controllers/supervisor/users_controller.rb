class Supervisor::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_supervisor
  before_action :load_user, except: %i(index new create)

  def index
    @users = User.trainee.by_lastest.page(params[:page]).per
      Settings.pages.per_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".add_success", name: @user.name
      redirect_to supervisor_users_path
    else
      flash[:error] = t ".add_fail"
      render :new
    end
  end

  def show; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to supervisor_users_path
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".warning"
    end
    redirect_to supervisor_users_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".not_found"
    redirect_to supervisor_users_path
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
  end

  def check_supervisor
    unless current_user.supervisor?
      flash[:danger] = t ".not_permission"
      redirect_to root_path
    end
  end
end
