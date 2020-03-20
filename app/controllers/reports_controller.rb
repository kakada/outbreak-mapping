class ReportsController < ApplicationController
  def index
    # @sites = Site.sum_nations
    # @total_cases, @total_heals, @total_deaths= Report.sum_results
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
