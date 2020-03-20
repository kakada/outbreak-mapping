class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :location_code
      t.integer :total_cases, default: 0
      t.integer :new_cases, default: 0

      t.timestamps
    end
  end
end
