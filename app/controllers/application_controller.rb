class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name is_artist])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  # def after_sign_up_path_for(_)
  #   current_user.is_artist? ? artist_dashboard_path : preferences_user_path(current_user)
  # end

  def after_sign_in_path_for(_)
    if (Time.now - 1.minute..Time.now).cover?(current_user.created_at)
      current_user.is_artist? ? artist_dashboard_path : preferences_user_path(current_user)
    else
      current_user.is_artist? ? artist_dashboard_path : discover_path(current_user)
    end
  end
end
