class SitesController < ApplicationController
  def index
    @sites = Site.sum_nations
    @total_cases, @total_heals, @total_deaths= Report.sum_results
  end

  def new
  end

  def create
    tempfile = file_params[:file]
    ::SiteService.import(tempfile.path)

    redirect_to sites_path, notice: "successfully imported"
  end

  private
    def file_params
      params.require(:sites).permit(:file)
    end
end
