class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :blurb
      t.string :description
      t.float :price
      t.integer :museum_id
      t.timestamps
    end
  end
end
