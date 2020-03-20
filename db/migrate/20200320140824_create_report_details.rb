class CreateReportDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :report_details do |t|
      t.string :field_name
      t.string :value
      t.integer :display_order, default: 1
      t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
