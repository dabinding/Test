module HomeHelper
  def resource_name
    :admin
  end

  def resource
    @admin ||= Admin.new
  end
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end
end
