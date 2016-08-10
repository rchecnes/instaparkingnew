class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.references :district, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
