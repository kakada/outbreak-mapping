class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.integer :cases, default: 0
      t.integer :heals, default: 0
      t.integer :deaths, default: 0
      t.references :site, null: false, foreign_key: true
      t.references :nation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
