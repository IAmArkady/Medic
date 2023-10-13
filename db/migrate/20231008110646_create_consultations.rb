class CreateConsultations < ActiveRecord::Migration[7.1]
  def change
    create_table :consultations do |t|
      t.references :patient, foreign_key: true, index: true
      t.string :text
      t.date :created_at, default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
  end
end
