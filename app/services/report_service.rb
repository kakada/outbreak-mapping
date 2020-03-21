require "csv"

class ReportService
  def self.import(path, original_filename)
    Report.destroy_all

    ::CSV.foreach(path, headers: true, encoding: "bom|utf-8") do |row|
      hash = row.to_hash

      report_params = {}

      report_params[:location_code] = hash.delete("location_code")
      report_params[:total_cases] = hash.delete("total_cases")
      report_params[:new_cases] = hash.delete("new_cases")
      report_params[:recovered_cases] = hash.delete("recovered_cases")
      report_params[:death_cases] = hash.delete("death_cases")

      report = Report.create(report_params)
      report.report_details.create(hash)
    end
  end
end
