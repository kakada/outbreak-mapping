class ReportsController < ApplicationController
  def index
    @cols = ReportDetail.order(display_order: :asc).pluck(:field_name).uniq
    @reports = Report.includes(:report_details)
  end

  def new
  end

  def create
    tempfile = file_params[:file]
    ::ReportService.import(tempfile.path, tempfile.original_filename)

    redirect_to reports_path, notice: "successfully imported"
  end

  private
    def file_params
      params.require(:reports).permit(:file)
    end
end
