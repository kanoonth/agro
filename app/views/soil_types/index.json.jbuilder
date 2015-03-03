json.array!(@soil_types) do |soil_type|
  json.extract! soil_type, :id, :name
  json.url soil_type_url(soil_type, format: :json)
end
