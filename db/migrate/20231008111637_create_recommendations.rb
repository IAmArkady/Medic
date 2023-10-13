class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.references :consultation, null: false, foreign_key: true
      t.string :text
    end
    add_index :recommendations, :consultation_id, unique: true, name: 'index_recommendations_on_consultation_id_unique'
  end
end
