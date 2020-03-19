# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @locations = Location.all
    @reports = mockup_data
    @summary_report = summary_report
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
      {
        id: "00",
        total: 40,
        location_name: "ប្រទេសកម្ពុជា",
        total: 40,
        active: 39,
        recovered: 1,
        fatal: 0,
        location: {},
        lat: 12.33233,
        lng: 104.875305
      }
    end
end
