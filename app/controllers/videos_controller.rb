class VideosController < ApplicationController
  def index
    @videos = Video.all.order(:display_order)
  end

  def new
  end

  def create
    tempfile = file_params[:file]
    ::VideoImportService.process(tempfile.path)

    redirect_to videos_path, notice: "Videos are successfully imported"
  end

  private
    def file_params
      params.require(:videos).permit(:file)
    end
end
