class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SimpleCaptcha::ControllerHelpers

  def after_sign_in_path_for(resource_or_scope)
    "#{root_path}#profile"
  end


end
