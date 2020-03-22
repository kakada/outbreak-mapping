require "csv"

class CsvImportService
  def self.process(path)
    model_class.transaction do
      model_class.destroy_all

      ::CSV.foreach(path, headers: true, encoding: "bom|utf-8") do |row|
        import_row row
      end
    end
  end

  def self.protected_params hash
    params = {}
    
    model_class.attribute_names.each do |attribute_name|
      params[attribute_name] = hash.delete(attribute_name)
    end

    params
  end

  def self.model_class; raise 'you have to implemented in subclass' end
  def self.import_row row; raise 'you hashave to implemented in subclass' end
end
