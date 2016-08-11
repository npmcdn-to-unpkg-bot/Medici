class CreateMuseums < ActiveRecord::Migration[5.0]
  def change
    create_table :museums do |t|
      t.string :name uniqueness: true
      t.string :blurb
      t.string :description
      t.string :location
      t.timestamps
    end
  end
end