require "csv"

class ReportService
  def self.import(path, original_filename)
    file_name = File.basename(original_filename, ".csv")
    klass = file_name.classify.constantize

    Report.destroy_all if file_name.inquiry.reports?

    ::CSV.foreach(path, headers: true) do |row|
      hash = row.to_hash

      klass.create(hash)
    end
  end
end
