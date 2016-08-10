class AddPlaceToFavorites < ActiveRecord::Migration
  def change
    add_reference :favorites, :place, index: true, foreign_key: true
  end
end
