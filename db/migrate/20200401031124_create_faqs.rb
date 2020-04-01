class CreateFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table :faqs do |t|
      t.text :question_km
      t.text :question_en
      t.text :answer_km
      t.text :answer_en
      t.integer :position

      t.timestamps
    end
  end
end
