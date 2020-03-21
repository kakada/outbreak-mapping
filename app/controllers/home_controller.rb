# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @locations = Location.all
    @reports = Report.includes(:location).all
    @json_reports = @reports.to_json(include: { location: { only: [:name_km, :latitude, :longitude] } })
    @summary_report = summary_report
    @device = DeviceDetector.new(request.user_agent)
  end

  private
    def mockup_data
      data = []
      @locations.each do |loc|
        total = rand(1...10)
        report = {
          id: loc.code,
          total: rand(1...10),
          location_name: loc.name_km,
          total: total,
          active: rand(1...total),
          recovered: rand(0...2),
          fatal: rand(0...2),
          location: loc,
          lat: loc.latitude,
          lng: loc.longitude
        }
        data << report
      end

      data.sort_by { |d| d[:total] }.reverse
    end

    def summary_report
      total_cases, recovered_cases, death_cases = Report.pluck("SUM(total_cases)", "SUM(recovered_cases)", "SUM(death_cases)").flatten
      active_cases = total_cases - recovered_cases - death_cases

      {
        id: 0,
        total_cases: total_cases,
        active_cases: active_cases,
        death_cases: death_cases,
        recovered_cases: recovered_cases,
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
