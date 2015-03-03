json.array!(@winds) do |wind|
  json.extract! wind, :id, :min, :max, :disease_id, :cf
  json.url wind_url(wind, format: :json)
end
