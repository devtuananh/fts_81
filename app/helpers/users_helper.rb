module UsersHelper
  def get_user id
    @user = User.find_by_id id
    return if @user
    flash[:danger] = t ".not_found"
    redirect_to root_path
  end
end
