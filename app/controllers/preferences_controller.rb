class PreferencesController < ApplicationController
  def create
    @preference = Preference.new(params[:preference][:style].reject(&:empty?))
    @preference.user = current_user
    @preference.save
    redirect_to discover_path(current_user)
  end
end
