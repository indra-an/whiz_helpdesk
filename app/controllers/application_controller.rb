class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

  before_action :set_cache_headers
  around_action :set_current_user
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to new_user_session_path
  end

  def set_conditions
    @conditions ||= (params[:conditions].present? && params[:conditions][:search].present?) ? params[:conditions][:search] : ""
  end

  def set_current_user
    Current.user = current_user
    yield
  ensure
    # to address the thread variable leak issues in Puma/Thin webserver
    Current.user = nil
  end


  protected

    def layout_by_resource
      if devise_controller?
        if resource_name == :user && (action_name == "edit" || action_name == "update") && (controller_path != "devise/passwords")
          "application"
        else
          "custom"
        end
      else
       "application"
      end
    end

  private

    def set_cache_headers
      response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
      response.headers["Pragma"] = "no-cache"
      response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end
