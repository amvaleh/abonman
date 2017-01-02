class HomeController < ApplicationController

  def home
    redirect_to admin_dashboard_path
  end

end
