class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :build_menu_indicator

  def build_menu_indicator
    @page ||= 'Login'
  end
  
  # This helper method is invoked when a user must be
  # authenticated before accessing an action. If the
  # user is not authenticated, the context is passed
  # on to home#index
  def must_be_authenticated!
    unless current_admin
      redirect_to :controller => 'home', :action => 'index'
    end
  end
end
