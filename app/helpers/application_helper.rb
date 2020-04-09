# frozen_string_literal: true

module ApplicationHelper
  def css_class_name
    prefix = params["controller"].downcase.split("/").join("-")
    subfix = params["action"]

    "#{prefix}-#{subfix}"
  end

  def get_css_active_class(name)
    return "active" if params["controller"] == name
  end

  def active_case(report)
    report.total_case - report.recovered_case - report.death_case
  end

  def mobile_request?
    params[:display_mode] != "desktop" && (@device.device_type == "smartphone" || @device.device_type == "phablet" || params[:display_mode] == "mobile")
  end
end
