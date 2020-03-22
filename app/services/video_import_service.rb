require "csv"

class VideoImportService < CsvImportService
  def self.model_class
    Video
  end

  def self.import_row row
    model_class.create(protected_params(row.to_hash))
  end
end
