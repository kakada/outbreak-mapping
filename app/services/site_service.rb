require "csv"

class SiteService
  def self.import(path)
    ::CSV.foreach(path, headers: true) do |row|
      hash = row.to_hash

      nation = hash.delete("nation")
      site_code = hash.delete("code")

      report = Report.new(hash)
      site = Site.find_or_create_by(code: site_code)
      nation = Nation.find_or_create_by(name: nation)

      report.site = site
      report.nation = nation

      report.save
    end
  end
end
