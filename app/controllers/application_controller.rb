# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_locale

  layout :layout_by_resource

  private
    def layout_by_resource
      devise_controller? ? "minimal" : "application"
    end

    def set_locale
      I18n.locale = params[:locale] || :km
    end
end
