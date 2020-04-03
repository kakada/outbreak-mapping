# frozen_string_literal: true

class SettingsController < AdminController
  def show
    @setting = Setting.first
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)

    if @setting.save
      redirect_to setting_path
    else
      flash.now[:alert] = @sop.errors.full_messages
      render :new
    end
  end

  def edit
    @setting = Setting.first
  end

  def update
    @setting = Setting.first

    if @setting.update(setting_params)
      redirect_to setting_path
    else
      flash.now[:alert] = @sop.errors.full_messages
      render :edit
    end
  end

  private
    def setting_params
      params.require(:setting).permit(:last_updated)
    end
end
