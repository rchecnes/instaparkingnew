json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :code, :started_at, :ended_at, :started_time, :ended_time, :users_id, :places_id, :reservation_types_id
  json.url reservation_url(reservation, format: :json)
end
