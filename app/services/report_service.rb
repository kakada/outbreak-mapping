require "csv"

class ReportService
  def self.import(path, original_filename)
    Report.transaction do
      Report.destroy_all

      ::CSV.foreach(path, headers: true, encoding: "bom|utf-8") do |row|
        import_row row
      end
    end
  end

  protected

  def self.import_row row
    whitelist_hash = whitelist_columns row.to_hash

    report = Report.new(protected_report_params(whitelist_hash))
    report.save do
      whitelist_hash.each do |k, v|
        next if Report.attribute_names.include?(k)

        report.report_details.create(field_name: k, field_value: v)
      end
    end
  end

  def self.whitelist_columns hash
    unused_columns = ENV.fetch('UNUSED_CSV_COLUMNS') { [] }

    unused_columns.split(',').each do |column_name|
      hash.delete(column_name)
    end

    hash
  end

  def self.protected_report_params hash
    params = {}
    
    Report.attribute_names.each do |attribute_name|
      params[attribute_name] = hash.delete(attribute_name)
    end

    params
  end
end
