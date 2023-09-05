class PreferencesController < ApplicationController
  def create
    array = params[:preference][:style].reject(&:empty?)
  end
end
