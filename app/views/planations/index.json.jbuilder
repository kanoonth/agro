json.array!(@planations) do |planation|
  json.extract! planation, :id, :name
  json.url planation_url(planation, format: :json)
end
