class HomeController < ApplicationController
  def index
    
  end


  def build_menu_indicator
    @page = 'Home'
    super
  end
end
