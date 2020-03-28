# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @locations = Location.all
    @reports = Report.includes(:location, :report_details).order('total_cases desc, updated_at desc').all
    @json_reports = @reports.to_json(include: { location: { only: [:name_km, :latitude, :longitude] } })
    @summary_report = summary_report
    @device = DeviceDetector.new(request.user_agent)
    @videos = Video.order(:display_order)
  end
end
