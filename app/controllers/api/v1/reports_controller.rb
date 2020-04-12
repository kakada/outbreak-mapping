class Api::V1::ReportsController < ApplicationController
  def index
    reports = Report.includes(:location)
      .where('new_case > ? or new_recovered_case > ? or new_death_case > ?', 0, 0, 0)

    render json: reports, each_serializer: V1::ReportSerializer
  end

end
