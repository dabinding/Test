module ApplicationHelper
  def admin?
    admin_signed_in?
  end
end
