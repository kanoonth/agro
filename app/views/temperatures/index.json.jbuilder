json.array!(@temperatures) do |temperature|
  json.extract! temperature, :id, :min, :max, :disease_id, :cf
  json.url temperature_url(temperature, format: :json)
end
