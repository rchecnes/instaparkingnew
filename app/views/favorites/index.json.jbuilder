json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :name, :users_id, :districts_id, :description
  json.url favorite_url(favorite, format: :json)
end
