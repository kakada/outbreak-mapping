class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :author
      t.string :url
      t.integer :display_order

      t.timestamps
    end
  end
end
