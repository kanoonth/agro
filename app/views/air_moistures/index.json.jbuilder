json.array!(@air_moistures) do |air_moisture|
  json.extract! air_moisture, :id, :min, :max, :disease_id, :cf
  json.url air_moisture_url(air_moisture, format: :json)
end
