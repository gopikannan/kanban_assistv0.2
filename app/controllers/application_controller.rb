class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  protected

  def layout_by_resource
      if devise_controller?
          "login"
      else
          "application"
      end
  end

  def after_sign_out_path_for(resource)
      stored_location_for(resource) || login_path
  end

  def after_sign_in_path_for(resource)
      #stored_location_for(resource) || welcomeuser_path
      stored_location_for(resource) || usergroup_path
  end
end
