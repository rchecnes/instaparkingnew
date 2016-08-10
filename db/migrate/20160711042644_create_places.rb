class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :address
      t.float :price
      t.string :url_image
      t.boolean :state
      t.boolean :state_list
      t.date :started_at
      t.date :ended_at
      t.time :started_time
      t.time :ended_time
      t.string :description
      t.references :user, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.references :reservation_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
