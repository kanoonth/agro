json.array!(@rains) do |rain|
  json.extract! rain, :id, :min, :max, :disease_id, :cf
  json.url rain_url(rain, format: :json)
end
