class AddNewRecoveredCaseAndNewDeathCaseToReports < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :new_recovered_case, :integer, default: 0
    add_column :reports, :new_death_case, :integer, default: 0
  end
end
