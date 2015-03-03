json.array!(@potassia) do |potassium|
  json.extract! potassium, :id, :min, :max, :stage_id, :disease_id, :cf
  json.url potassium_url(potassium, format: :json)
end
