json.array!(@soil_moistures) do |soil_moisture|
  json.extract! soil_moisture, :id, :min, :max, :disease_id, :cf
  json.url soil_moisture_url(soil_moisture, format: :json)
end
