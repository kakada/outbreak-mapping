class RenameCasesToCaseReports < ActiveRecord::Migration[6.0]
  def change
    rename_column :reports, :total_cases, :total_case
    rename_column :reports, :new_cases, :new_case
    rename_column :reports, :recovered_cases, :recovered_case
    rename_column :reports, :death_cases, :death_case
  end
end
