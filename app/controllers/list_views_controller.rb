# frozen_string_literal: true

class ListViewsController < ApplicationController
  def index
    @reports = Report.includes(:location, :report_details).order('total_case desc, updated_at desc').all
    @json_reports = @reports.to_json(include: { location: { only: [:name_km] } })
    @summary_report = summary_report
    @setting = Setting.first || Setting.new
  end
end
