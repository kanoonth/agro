json.array!(@area_types) do |area_type|
  json.extract! area_type, :id, :name
  json.url area_type_url(area_type, format: :json)
end
