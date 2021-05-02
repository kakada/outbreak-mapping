require "csv"

class ReportImportService < CsvImportService
  def self.model_class
    Report
  end

  def self.import_row row
    whitelist_hash = whitelist_columns row.to_hash

    report = model_class.new(protected_params(whitelist_hash))
    report.save do
      whitelist_hash.each do |k, v|
        next if model_class.attribute_names.include?(k)

        report.report_details.create(field_name: k, field_value: v)
      end
    end
  end

  protected

  def self.whitelist_columns hash
    unused_columns = ENV.fetch('UNUSED_CSV_COLUMNS') { [] }

    unused_columns.split(',').each do |column_name|
      hash.delete(column_name.strip)
    end

    hash
  end
end
