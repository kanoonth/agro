json.array!(@phosphorus) do |phosphoru|
  json.extract! phosphoru, :id, :min, :max, :stage_id, :disease_id, :cf
  json.url phosphoru_url(phosphoru, format: :json)
end
