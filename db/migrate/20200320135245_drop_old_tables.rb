class DropOldTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :reports
    drop_table :nations
    drop_table :sites
  end
end
