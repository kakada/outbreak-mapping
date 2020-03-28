# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_locale, :set_device

  layout :layout_by_resource

  private
    def layout_by_resource
      devise_controller? ? "minimal" : "application"
    end

    def set_locale
      I18n.locale = params[:locale] || :km
    end

    def summary_report
      total_cases, recovered_cases, death_cases, new_cases = Report.pluck("SUM(total_cases)", "SUM(recovered_cases)", "SUM(death_cases)", "SUM(new_cases)").flatten

      report = Report.new({
        total_cases: total_cases,
        death_cases: death_cases,
        recovered_cases: recovered_cases,
        new_cases: new_cases,
        location_code: "00"
      })

      report.build_location({
        code: "00",
        name_km: "ប្រទេសកម្ពុជា"
      })

      report
    end

    def set_device
      @device = DeviceDetector.new(request.user_agent)
    end
end
