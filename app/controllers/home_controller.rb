# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @reports = Report.includes(:location, :report_details).order("total_case desc, updated_at desc").all
    @json_reports = @reports.to_json(include: { location: { only: [:name_km, :latitude, :longitude] } })
    @summary_report = summary_report
    @json_summary_report =summary_report.to_json(include: { location: { only: [:name_km, :latitude, :longitude] } })
    @videos = Video.order(:display_order)
    @setting = Setting.first || Setting.new
  end
end
