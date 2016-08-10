json.array!(@places) do |place|
  json.extract! place, :id, :address, :price, :url_image, :state, :started_at, :ended_at, :started_time, :ended_time, :description, :users_id, :districts_id, :reservation_types_id
  json.url place_url(place, format: :json)
end
