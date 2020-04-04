# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @reports = Report.includes(:location, :report_details).order("total_case desc, updated_at desc").all
    @json_reports = @reports.to_json(include: { location: { only: [:name_km, :latitude, :longitude] } })
    @summary_report = summary_report
    @videos = Video.order(:display_order)
    @setting = Setting.first || Setting.new
  end
end
