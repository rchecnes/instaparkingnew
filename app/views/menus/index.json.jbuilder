json.array!(@menus) do |menu|
  json.extract! menu, :id, :name, :description, :flag, :icon
  json.url menu_url(menu, format: :json)
end
