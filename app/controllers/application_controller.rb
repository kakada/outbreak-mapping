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
      total_case, recovered_case, death_case, new_case = Report.pluck("SUM(total_case)", "SUM(recovered_case)", "SUM(death_case)", "SUM(new_case)").flatten

      report = Report.new({
        total_case: total_case,
        death_case: death_case,
        recovered_case: recovered_case,
        new_case: new_case,
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
