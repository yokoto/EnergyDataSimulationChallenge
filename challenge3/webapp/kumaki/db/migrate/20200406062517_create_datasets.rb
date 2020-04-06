class CreateDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :datasets do |t|
      t.integer :label, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.decimal :temperature, precision: 3, scale: 1, null: false
      t.decimal :daylight, precision: 5, scale: 1, null: false
      t.integer :energy_production
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end