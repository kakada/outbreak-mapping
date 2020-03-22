require 'rails_helper'
require 'csv'

RSpec.describe ReportImportService, type: :model do
  context 'import row csv' do
    let!(:location) { Location.create(code: '01', name_en: 'PP', name_km: 'PP', kind: 'province') }
    let(:headers) { ['location_code', 'total_cases', 'new_cases', 'recovered_cases', 'death_cases', 'Nationality'] }
    let(:values) { ['01', 1, 0, 0, 0, 'foo'] }
    let(:csv_row) { CSV::Row.new(headers, values) }

    context 'should create a new report' do
      it { expect{ReportImportService.import_row(csv_row)}.to change{Report.count}.by(1) }
    end

    context "should create a new report detail when it has 1 additional 'Nationality' field" do
      it { expect{ReportImportService.import_row(csv_row)}.to change{ReportDetail.count}.by(1) }
    end

    context "should not create new report detail when additional fields are in unused csv columns" do
      let(:headers) { ['location_code', 'total_cases', 'new_cases', 'recovered_cases', 'death_cases', 'location_name', 'Nationality'] }
      let(:values) { ['01', 1, 0, 0, 0, 'PP', 'foo'] }
      let(:csv_row) { CSV::Row.new(headers, values) }

      it { expect{ReportImportService.import_row(csv_row)}.to change{ReportDetail.count}.by(1) }
    end
  end
end
