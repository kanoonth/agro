json.array!(@ecology_certainty_factors) do |ecology_certainty_factor|
  json.extract! ecology_certainty_factor, :id, :disease_id, :ecology_id, :cf
  json.url ecology_certainty_factor_url(ecology_certainty_factor, format: :json)
end
