class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :fio
      t.date :birthdate
      t.string :phone
      t.string :email
    end
  end
end
