json.array!(@menu_roles) do |menu_role|
  json.extract! menu_role, :id, :menus_id, :roles_id
  json.url menu_role_url(menu_role, format: :json)
end
