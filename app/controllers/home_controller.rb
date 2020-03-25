# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @locations = Location.all
    @reports = Report.includes(:location, :report_details).all
    @json_reports = @reports.to_json(include: { location: { only: [:name_km, :latitude, :longitude] } })
    @summary_report = summary_report
    @device = DeviceDetector.new(request.user_agent)
    @videos = Video.order(:display_order)
  end

  private
    def summary_report
      total_cases, recovered_cases, death_cases, new_cases = Report.pluck("SUM(total_cases)", "SUM(recovered_cases)", "SUM(death_cases)", "SUM(new_cases)").flatten
      active_cases = total_cases - recovered_cases - death_cases

      {
        id: 0,
        total_cases: total_cases,
        active_cases: active_cases,
        death_cases: death_cases,
        recovered_cases: recovered_cases,
        new_cases: new_cases,
        location: {
          code: "00",
          name_km: "ប្រទេសកម្ពុជា",
          latitude: 12.33233,
          longitude: 104.875305
        },
        location_code: "00"
      }
    end
end
