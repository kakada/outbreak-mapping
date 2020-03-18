class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :code, default: "", index: true

      t.timestamps
    end
  end
end
