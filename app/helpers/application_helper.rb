module ApplicationHelper
  def user_is_admin?
    current_user.is_admin?
  end
end
