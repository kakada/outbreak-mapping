# frozen_string_literal: true

class CreateSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :settings do |t|
      t.string :last_updated

      t.timestamps
    end
  end
end
