class AboutsController < ApplicationController
  def show
    @device = DeviceDetector.new(request.user_agent)
  end
end
