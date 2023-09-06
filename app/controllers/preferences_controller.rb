class PreferencesController < ApplicationController
  def create
    params[:preference][:style].reject(&:empty?).each do |style|
      Preference.create(style: style, user: current_user)
    end
    redirect_to discover_path(current_user)
  end
end
